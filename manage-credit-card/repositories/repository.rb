class Repository
  def initialize
    @database = Configs::Database.start_connection
  end
end
