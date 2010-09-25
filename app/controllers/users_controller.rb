class UsersController < ApplicationController
  def connect
    request_token = @client.request_token(
        :oauth_callback => "http://twitterkiosk.heroku.com/users/auth"
      )
      session[:request_token] = request_token.token
      session[:request_token_secret] = request_token.secret
      redirect_to request_token.authorize_url.gsub('authorize', 'authenticate')
  end
  
  
  def auth
    begin
    @access_token = @client.authorize(
         session[:request_token],
         session[:request_token_secret],
         :oauth_verifier => params[:oauth_verifier]
       )
     rescue OAuth::Unauthorized
     end

     if @client.authorized?
         # Storing the access tokens so we don't have to go back to Twitter again
         # in this session.  In a larger app you would probably persist these details somewhere.
         session[:access_token] = @access_token.token
         session[:secret_token] = @access_token.secret
         redirect_to '/kiosks'
       else
         redirect_to '/'
     end
  end
  
end
