$KCODE = "U"
require 'rubygems'
require 'robotwitter'

Robotwitter::Path.set_base File.dirname(__FILE__)

PHRASE_GETTER = nil

client = Robotwitter::Robot.new "config.yml", 'inglip' , &PHRASE_GETTER
client.unfollow_users