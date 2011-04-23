$KCODE = "U"
require 'rubygems'
require 'robotwitter'
require 'pp'

PHRASE_GETTER = lambda do
  db = SQLite3::Database.new "maniak.db"
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

Robotwitter::Path.set_base File.dirname(__FILE__)
client = Robotwitter::Robot.new "config.yml", 'serialmaniak' , &PHRASE_GETTER

begin
  client.follow_all_back
  client.send_message '_msg_'
rescue => msg
  pp 'error: ' + msg
end