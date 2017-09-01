module Luis
  class Configuration
    attr_accessor :endpoint_url
    attr_accessor :timeout

    def initialize
      @endpoint_url = nil
      @timeout = 20
    end
  end
end
