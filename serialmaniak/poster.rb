$KCODE = "U"
require 'sqlite3'
require "#{File.dirname(__FILE__)}/robot"

PHRASE_GETTER = lambda do
  db = SQLite3::Database.new "maniak.db"
  text = nil
  until (!text.nil? and text.length < 121)
    row = db.get_first_row "select * from quotes \
where id not in (select id from posted)\
ORDER BY RANDOM() "
    fail 'no texts found' if row.nil?
    id, text = row[0], row[2]
    db.execute_batch "insert into posted (id) values (#{id})"
  end
  text
end

client = Robot.new({:consumer_key => 'qhQYAKHy5mVWhdqPD0DX1g',
  :consumer_secret => 'bFgbeWrr6y10qtFrC089WswSgbhWdmQPYZxbvB30uwk',
  :oauth_token => '27295510-cZOZYtSnRHYEdnLyIcEbWPFaDQz0Ev7RdZanUbZY',
  :oauth_token_secret => '6bIrZX6burEjHS5BMrYcQDBFKvtK2lsr4E2sOcnOQYg'}, &PHRASE_GETTER)

begin
  client.send_message '_msg_'
rescue => msg
  pp 'error: ' + msg
end
