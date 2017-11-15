module Luis
  class AlteredQuery
    attr_reader :text

    def initialize(payload)
      @text = payload
    end
  end
end
