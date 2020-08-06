require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV['SESSION_SECRET']
    # SecureRandom.hex(64)
  end

  #Index action = home page
  get "/" do
    erb :welcome
  end

  # Helper actions for authentication and authorization of users 
  helpers do 
    def current_user
      @user = User.find_by(id: session[:user_id])
    end

    def logged_in?
      !!current_user
    end
  end

end