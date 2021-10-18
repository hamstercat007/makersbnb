require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'makersbnb_test')

  # Clean the bookmarks table
  connection.exec("TRUNCATE venues, bookings, users;")
end
