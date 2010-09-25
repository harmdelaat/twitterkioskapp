class TweetsController < ApplicationController
  require 'twitter_oauth'
  
  def get_tweets
    @kiosk = Kiosk.find(params[:id])
    if Rails.env == "development"
      @client = TwitterOAuth::Client.new(
        :consumer_key => APP_CONFIG["twitter"]["consumer_key"],
        :consumer_secret => APP_CONFIG["twitter"]["consumer_secret"],
        :token => APP_CONFIG["twitter"]["token"],
        :secret => APP_CONFIG["twitter"]["secret"])
    end
      
    begin  
      @tweets = @client.friends_timeline
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
