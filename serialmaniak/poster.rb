$KCODE = "U"
require 'sqlite3'
require 'pp'

base = File.dirname(__FILE__)

require "#{base}/robot"
require 'yaml'

yml = YAML.load_file "#{base}/config.yml" 

PHRASE_GETTER = lambda do
  db = SQLite3::Database.new "#{base}/maniak.db"
  text = nil
  until (!text.nil? and text.length < 121)
    row = db.get_first_row "select * from quotes \
where id not in (select id from posted)\
ORDER BY RANDOM() #"
    fail 'no texts found' if row.nil?
    id, text = row[0], row[2]
    db.execute_batch "insert into posted (id) values (#{id})"
  end
  text
end

client = Robot.new({:consumer_key => yml['serialmaniak']['consumer_key'],
  :consumer_secret => yml['serialmaniak']['consumer_secret'],
  :oauth_token => yml['serialmaniak']['oauth_token'],
  :oauth_token_secret => yml['serialmaniak']['oauth_token_secret']}, &PHRASE_GETTER)

begin
  client.follow_all_back
  client.send_message '_msg_'
rescue => msg
  pp 'error: ' + msg
end