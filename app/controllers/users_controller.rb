class UsersController < ApplicationController

    #new action
    get '/signup' do
        erb :'users/signup'
    end

    #create action
    post '/signup' do
        user = User.create(params)
        if user.valid?
            # binding.pry
            session[:user_id] = user.id
            redirect '/bucketlistgoals'
        else
            erb :'users/signup'
        end
    end

    #essentially another new action
    get '/login' do 
        erb :'users/login'
    end

    #essentially a create action but specifically authenicating params
    post '/login' do
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            # add success message 
            flash[:message] = "Welcome #{user.user_name}"
            redirect '/bucketlistgoals'
        else
            # Error message
            flash[:error] = "Either Password or Email is incorrect!"
            redirect '/login'
            # @error = 'Either Password or Email is incorrect!'
            # erb :'users/login'
        end
    end

    delete '/logout' do
        session.destroy
        redirect '/'
    end

end