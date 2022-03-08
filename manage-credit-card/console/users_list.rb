module Console
  class UsersList < CommandBase
    def key
      'users:list'
    end

    def execute
      result = UseCase::UsersList.new({}).all
      result
    end
  end
end
