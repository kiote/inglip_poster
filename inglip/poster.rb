$KCODE = "U"
require 'rubygems'
require 'robotwitter'

Robotwitter::Path.set_base File.dirname(__FILE__)

PHRASE_GETTER = lambda do
    open("http://inglip.ru/api/claim") do |f|
      f.each do |line|
        @line = line
      end
    end

    @line
end

client = Robotwitter::Robot.new "config.yml", 'inglip' , &PHRASE_GETTER
client.send_message "_msg_ #inglip"

client.follow_all_back