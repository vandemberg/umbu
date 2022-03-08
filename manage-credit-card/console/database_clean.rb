module Console
  class DatabaseClean < CommandBase
    def key
      'db:reset'
    end

    def execute
      database = Configs::Database.start_connection
      UseCase::ResetDatabase.new(database).clean_tables
    end
  end
end
