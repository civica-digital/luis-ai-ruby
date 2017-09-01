require "json"
require "rest-client"
require "uri"

require "luis/configuration"
require "luis/version"
require "luis/entity"
require "luis/intent"
require "luis/composite_entity"

module Luis

  class Result
    attr_reader :query, :intents, :entities, :composite_entities

    def initialize(query, intents, entities, composite_entities)
      @query = query || :no_query_provided
      @intents = intents || []
      @entities = entities || []
      @composite_entities = composite_entities || []
    end

    def top_scoring_intent
      @intents.first
    end
  end

  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.reset
    @configuration = Configuration.new
  end

  def self.configure
    yield(configuration)
  end

  def self.query(utterance)
    endpoint = configuration.endpoint_url
    raise "#{self} requires an endpoint url" if endpoint == nil

    escaped_utterance = URI.escape(utterance)
    url = "#{endpoint}#{escaped_utterance}"
    begin
      result = RestClient::Request.execute(method: :get, url: url, timeout: @configuration.timeout)
      json = JSON.parse(result)
      return parse_response(json)
    rescue RestClient::Exceptions::Timeout => e
      raise Error::Timeout, e
    rescue => e
      raise Error::ConnectionError, e
    end
    nil
  end

  private

  def self.parse_response(response)
    raise "#{self} received a nil response" if response == nil

    query = response["query"]

    intents = [ Intent.new(response["topScoringIntent"]) ]
    if response.has_key?("intents")
      for intent in response["intents"][1..-1] do  # The first is always the top scoring intent.
        intents.push(Intent.new(intent))
      end
    end

    entities = []
    for entity in response["entities"] do
      entities.push(Entity.new(entity))
    end

    composite_entities = []
    if response.has_key?("compositeEntities")
      for composite_entity in response["compositeEntities"] do
        composite_entities.push(CompositeEntity.new(composite_entity))
      end
    end

    Result.new(query, intents, entities, composite_entities)
  end

  module Error
    class Timeout < StandardError; end
    class ConnectionError < StandardError; end
  end

end
