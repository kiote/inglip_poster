# v 0.2
# @author kiote
# инициализируется внешним "получателем"
# который должен выдавать строки
require "rubygems"
require "twitter"
require "open-uri"
require 'pp'

class Robot
  attr_accessor :stub

  # getter should be a lambda - function
  # which returns string
  # example of getter
  #
  #  SQLITE_GETTER = lambda do |s|
  #    db = SQLite3::Database.new("database.db")
  #    db.get_first_row( "select * from table" )
  #  end
  def initialize yml, section, &getter
    @getter = getter
    @followers_ids = nil
    @following_ids = nil

    @stub = false
    
    Twitter.configure do |config|
      config.consumer_key = yml[section]['consumer_key']
      config.consumer_secret = yml[section]['consumer_secret']
      config.oauth_token = yml[section]['oauth_token']
      config.oauth_token_secret = yml[section]['oauth_token_secret']
    end
    @client = Twitter::Client.new
  end

  # follow who follows me
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

  def send_message_mention pattern

  end

  # follow who tweet about word
  def follow_users_tweets_about word
    users = search_users_tweets_about word

    get_followers_ids
    get_following_ids
    pp users
    users.each do |user|
      id = user['from_user_id']
      name = user['from_user']
      begin
        if (not @followers_ids.include?(id)) \
          and (not @following_ids.include?(id) and not @stub)
          @client.follow name
          pp name
        end
      rescue  Exception => msg
        pp "Error #{msg}"
      end
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

  # get phrase
  def get_phrase
    @getter.call self
  end

  # ищем пользователей, которые пишут о
  def search_users_tweets_about word
    Twitter::Search.new.containing(word).locale("ru").per_page(5).fetch
  end

  # get follower ids
  def get_followers_ids
    if @followers_ids.nil?
      @followers_ids = @client.follower_ids['ids']
    end
    @followers_ids
  end

  # get following ids
  def get_following_ids
    if @following_ids.nil?
      @following_ids = @client.friend_ids['ids']
    end
  end
end