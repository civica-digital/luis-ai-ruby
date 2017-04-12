module Luis
  class CompositeEntity
    attr_reader :type, :value, :children

    def initialize(payload)
      @type = payload["parentType"].to_sym
      @name = payload["value"]
      # TODO(ricalanis): Sym components
      @children = payload["children"]
    end
  end
end
