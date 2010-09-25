class TweetsController < ApplicationController
  require 'twitter_oauth'
  
  def get_tweets
    begin
      client = TwitterOAuth::Client.new(
        :consumer_key => APP_CONFIG["twitter"]["consumer_key"],
        :consumer_secret => APP_CONFIG["twitter"]["consumer_secret"],
        :token => APP_CONFIG["twitter"]["token"],
        :secret => APP_CONFIG["twitter"]["secret"])
      @tweets = client.friends_timeline
    rescue
      return "Twitter feed temporarily unavailable."
    end
    
    respond_to do |format|
      format.js {
        @tweets.map! do |t|
          [t["user"]["name"], t["text"]]
        end
        render :text => @tweets.to_json
      }
    end
  end
end
