module Luis
  class Intent
    attr_reader :name, :score

    def initialize(payload)
      @name = payload["intent"]
      @score = payload["score"]
    end
  end
end
