$KCODE = "U"
require 'rubygems'
require 'robotwitter'

Robotwitter::Path.set_base File.dirname(__FILE__)

client = Robotwitter::Robot.new "config.yml", 'wanna'
client.retweet_about 'wannafun'
client.follow_all_back
