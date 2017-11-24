require "spec_helper"

describe Luis do
  before do
    Luis.configure do |config|
      config.endpoint_url = 'foo'
    end
  end

  context "query" do

    it "returns nil when the query is empty" do
      expect(Luis.query("")).to eq(nil)
    end

    it "raises timeout exception when there is a timeout" do
      allow(RestClient::Request).to receive(:execute).and_raise(RestClient::Exceptions::Timeout)
      expect { Luis.query("hello world") }.to raise_error(Luis::Error::Timeout)
    end

    it "raises connection error when there is another error" do
      allow(RestClient::Request).to receive(:execute).and_raise(RestClient::NotFound)
      expect { Luis.query("hello world") }.to raise_error(Luis::Error::ConnectionError)
    end
  end
end
