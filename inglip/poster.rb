# encoding: utf-8
require 'rubygems'
require 'robotwitter'

client = Robotwitter::Robot.new(File.expand_path('..', __FILE__), 'inglip') do
  open("http://inglip.ru/api/claim") do |f|
    f.each do |line|
      @line = line
    end
  end
  @line
end

client.send_message "_msg_ #inglip"

client.follow_all_back