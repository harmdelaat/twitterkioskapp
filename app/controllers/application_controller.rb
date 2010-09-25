class ApplicationController < ActionController::Base
  protect_from_forgery
  
  after_sign_in_path_for kiosks_url
  
  
  protected
  def set_client
    logger.debug("setting client")
    @client = TwitterOAuth::Client.new(
        :consumer_key => "G8AEt0IJONFM3ZXT10BEgA",
        :consumer_secret => "cO2v6qROjxbiddQ3ezEVaSTm5l2H54cJZFznFK4wpJQ",
        :token => session[:access_token],
        :secret => session[:secret_token]
    )
    logger.debug("client #{@client.inspect}")
  end
  
  
end
