# init serialmaniak database
require 'sqlite3'

db = SQLite3::Database.new("maniak.db")

sql = <<SQL
    create table quotes (
      id  integer PRIMARY KEY AUTOINCREMENT,
      person_id intger,
      body text
    );
    create table persons (
      id integer primary key autoincrement,
      name text
    );
    create table posted (
      id integer primary key
    );
SQL

db.execute_batch( sql )

