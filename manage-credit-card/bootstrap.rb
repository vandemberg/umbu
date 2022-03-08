# Gems
require "mysql2"
require "byebug"

# Files
require_relative "configs/database"
require_relative "console/command_base"
require_relative "console/command"
require_relative "console/database_clean"
require_relative "console/users_list"

require_relative "repositories/repository"
require_relative "repositories/users_repository"

require_relative "use_case/reset_database"
require_relative "use_case/users/users_list"
