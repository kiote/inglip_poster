$KCODE = "U"

require 'robot'

client = Robot.new 'http://inglip.ru/api/claim',
  {:consumer_key => 'hKPOMjFpO1s8o1JQjyZw',
  :consumer_secret => 'WawVo9H9BM8KukM233cMDMXm9AhsoIJx9GjOoVqXc',
  :oauth_token => '248583431-sSXFO1QpjntCNZMZO7ZoykRMTCJKEnUBSxEN30K4',
  :oauth_token_secret => 'LmzpnfmIrM7feiLYl17xoZBFfTw9RXpCu1XO8BbuE'}

client.unfollow_users