require "rubygems"                                                                                                                                                                  
require "twitter"
require "open-uri"
require 'pp'

class Robot
  attr_accessor :stub

  def initialize url, params
    @url = url
    
    @followers_ids = nil
    @following_ids = nil

    @stub = false

    Twitter.configure do |config|
      config.consumer_key = params[:consumer_key]
      config.consumer_secret = params[:consumer_secret]
      config.oauth_token = params[:oauth_token]
      config.oauth_token_secret = params[:oauth_token_secret]
    end
    @client = Twitter::Client.new
  end

  def follow_all_back
    get_followers_ids
    get_following_ids

    follow_them = @followers_ids - @following_ids
    pp 'follows:'
    follow_them.each do |id|
      begin
	@client.follow id if not @stub
      rescue 
      end
      pp id
    end
  end

  # string '_msg_ somth'
  def send_message pattern
    phrase = get_phrase
    send = pattern.gsub('_msg_', phrase)
    @client.update send if not @stub
    pp send
  end

  def follow_users_tweets_about word
    users = search_users_tweets_about word

    get_followers_ids
    get_following_ids

    users.each do |user|
      id = user['from_user_id']
      begin
        @client.follow id if (not @followers_ids.include?(id)) \
          and (not @following_ids.include?(id) and not @stub)
      rescue
      end
      pp id
    end
  end

  #unfollow who not following me
  def unfollow_users
    get_followers_ids
    get_following_ids

    unfollow_them = @following_ids - @followers_ids
    unfollow_them.each do |id|
      begin
        @client.unfollow id if not @stub
      rescue
      end
      pp id
    end
  end

  protected
  def get_phrase
    open(@url) do |f|
      f.each do |line|
        @line = line
      end
    end

    @line
  end

  # ищем пользователей, которые пишут о
  def search_users_tweets_about word
    Twitter::Search.new.containing(word).per_page(5).fetch
  end

  def get_followers_ids
    if @followers_ids.nil?
      @followers_ids = @client.follower_ids['ids']
    end
    @followers_ids
  end

  def get_following_ids
    if @following_ids.nil?
      @following_ids = @client.friend_ids['ids']
    end
  end
end