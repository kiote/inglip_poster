$KCODE = "U"

require "rubygems"
require "twitter"
require "open-uri"

def get_phrase
  open('http://wannafun.ru/api/phrase') do |f|
    f.each do |line|
      @line = line
    end
  end

  @line
end

def follow_all client
  followers_ids = client.follower_ids['ids']
  following_ids = client.friend_ids['ids']

  follow_them = followers_ids - following_ids

  follow_them.each do |id|
    client.follow id
  end
end


Twitter.configure do |config|
  config.consumer_key = 'HE82cSwpfaC6uqDghK1Y4g'
  config.consumer_secret = 'HDrdPHNFviJNSxjl3j7A5easuyD2T1qY7UEFmqs'
  config.oauth_token = '248664187-4zo2x6Vireg4b4JPE5gV8TV84BC8Jhq5KHyRBLwa'
  config.oauth_token_secret = 'Fvv3V52hrK59vP5hqYCQIi9cUo5CWQ71VsBEt7vkc'
end

client = Twitter::Client.new


begin
  @update = "#{get_phrase} #wannafun";
end while @update.length > 120

client.update(@update)

follow_all client