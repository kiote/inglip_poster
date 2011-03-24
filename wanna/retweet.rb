$KCODE = "U"
base = File.dirname(__FILE__)

require base + '/../lib/robot'

Robot::Path.set_base(base)
client = Robot::Robot.new "#{base}/config.yml", 'wanna'
client.retweet_about 'wannafun'
