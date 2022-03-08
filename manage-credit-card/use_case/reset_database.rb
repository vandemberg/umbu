module UseCase
  class ResetDatabase
    def initialize(database)
      @database = database
    end

    def clean_tables
      @database.disable_foreign_key_checks

      %w(users responsibles).each do |table|
        @database.connection.query("truncate #{table}")
      end
      
      @database.enable_foreign_key_checks
    end
  end
end