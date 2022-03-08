class UsersRepostiroy < Repository
  def all
    @database.connection.query("select *from users")
  end
end
