module Luis
  class Entity
    attr_reader :name, :type, :start_index, :end_index, :score

    def initialize(payload)
      @name = payload["entity"]
      @type = payload["type"].to_sym
      @start_index = payload["startIndex"]
      @end_index = payload["endIndex"]
      @score = payload["score"]
    end
  end
end
