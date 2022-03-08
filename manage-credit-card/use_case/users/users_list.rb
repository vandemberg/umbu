module UseCase
  class UsersList
    def initialize(params)
      @params = params
    end

    def all
      results = UsersRepostiroy.new.all

      results.each do |row|
        row
      end
    end
  end
end
