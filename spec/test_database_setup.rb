p "Setting up test database..."

require 'pg'

connection = PG.connect(dbname: 'bookmark_manager_test')

p "Cleaning up any previous entries..."

connection.exec("TRUNCATE links;")

connection.exec("INSERT INTO links VALUES(1, 'http://www.makersacademy.com');")
connection.exec("INSERT INTO links VALUES(2, 'http://www.google.com');")
connection.exec("INSERT INTO links VALUES(3, 'http://www.facebook.com');")
