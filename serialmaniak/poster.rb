$KCODE = "U"
require 'sqlite3'
require 'pp'

base = File.dirname(__FILE__)

require "#{base}/robot"

PHRASE_GETTER = lambda do
  db = SQLite3::Database.new "#{base}/maniak.db"
  text = nil
  until (!text.nil? and text.length < 121)
    row = db.get_first_row "select * from quotes \
where id not in (select id from posted)\
ORDER BY RANDOM()"
    fail 'no texts found' if row.nil?
    id, text = row[0], row[2]
    db.execute_batch "insert into posted (id) values (#{id})"
  end
  text
end

client = Robot.new "#{base}/config.yml", 'serialmaniak' , &PHRASE_GETTER

begin
  client.follow_all_back
  client.send_message '_msg_'
rescue => msg
  pp 'error: ' + msg
end