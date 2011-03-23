$KCODE = "U"
require 'lib/robot'

base = File.dirname(__FILE__)

Robot::Path.set_base(base)
client = Robot::Robot.new "#{base}/config.yml", 'wanna'
client.stub = true
client.retweet_about 'wannafun'
