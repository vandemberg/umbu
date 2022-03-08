module Configs
  class Database
    def initialize(database:, username:, password:)
      @database, @username, @password = database, username, password
    end

    def connection
      @connection ||= Mysql2::Client.new(
        :host => "localhost",
        :username => @username,
        :password => @password,
        :database => @database
      )
    end

    def disable_foreign_key_checks
      connection.query("SET FOREIGN_KEY_CHECKS = 0")
    end

    def enable_foreign_key_checks
      connection.query("SET FOREIGN_KEY_CHECKS = 1")
    end

    def self.start_connection
      database = Database.new(database: "credit_cards", username: "user", password: "secret")
      database.connection

      database
    end
  end
end
