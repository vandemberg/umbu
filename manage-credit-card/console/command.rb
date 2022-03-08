module Console
  class Command
    attr_accessor :commands

    def initialize
      self.commands = []
    end

    def add(command)
      self.commands << command
    end

    def execute(arg)
      self.commands.each do |command|
        return command.execute if command.match?(arg)
      end

      raise("Commmand not found")
    end

    def self.execute_commands(arg)
      command = Console::Command.new
      command.add(Console::DatabaseClean.new)
      command.add(Console::UsersList.new)
      command.execute(arg)
    end
  end
end
