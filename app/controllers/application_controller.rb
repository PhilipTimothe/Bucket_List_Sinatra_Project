require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'secret'
    # SecureRandom.hex(64)
  end

  get "/" do
    erb :welcome
  end

  helpers do 
    def current_user
      @user = User.first
    end

    # def self.current_user(session)
    #   session[:user_id]
    #   @user = User.find_by(id: session[:user_id])
    #   @user
    # end

    # def self.is_logged_in?(session)
    #   if session[:user_id]
    #       true
    #   end
    # end

  end




end