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

client = Robot.new({:consumer_key => 'hKPOMjFpO1s8o1JQjyZw',
  :consumer_secret => 'WawVo9H9BM8KukM233cMDMXm9AhsoIJx9GjOoVqXc',
  :oauth_token => '248583431-sSXFO1QpjntCNZMZO7ZoykRMTCJKEnUBSxEN30K4',
  :oauth_token_secret => 'LmzpnfmIrM7feiLYl17xoZBFfTw9RXpCu1XO8BbuE'}, &PHRASE_GETTER)

begin
  client.send_message '_msg_'
rescue => msg
  pp 'error: ' + msg
end
