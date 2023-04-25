require_relative './lib/database_connection'
require_relative './lib/book_repository'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('book_store')

# Perform a SQL query on the database and get the result set.
# sql = 'SELECT id, title FROM books;'
# result = DatabaseConnection.exec_params(sql, [])

book_repository = BookRepository.new

# Print out each record from the result set .
book_repository.all.each do |record|
  p record.id + " - " + record.title + " - " + record.author_name
end