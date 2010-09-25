class TweetsController < ApplicationController
  require 'twitter_oauth'
  
  before_filter :set_client
  
  
  def get_tweets
    @kiosk = Kiosk.find(params[:id])
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
