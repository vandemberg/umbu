module Console
  class CommandBase
    def match?(argument)
      argument == key
    end

    def execute
      raise("Need implement execute method")
    end

    def key
      raise("Key not defined to #{self.class}")
    end
  end
end