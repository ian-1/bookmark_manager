require_relative 'lib/database_connection'

if ENV['RACK_ENV'] == 'test'
  p 'Setting database as test database...'
  DatabaseConnection.setup('bookmark_manager_test')
else
  p 'Setting database as development database...'
  DatabaseConnection.setup('bookmark_manager')
end
