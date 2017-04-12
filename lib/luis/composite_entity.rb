module Luis
  class CompositeEntity
    attr_reader :type, :value, :children

    def initialize(payload)
      @parent_type = payload["parentType"].to_sym
      @value = payload["value"]
      # TODO(ricalanis): Sym components
      @children = payload["children"]
    end
  end
end
