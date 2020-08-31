class BucketListGoalsController < ApplicationController

    #index action
    get '/bucketlistgoals' do
        if logged_in?
            @bucketlistgoal = current_user.bucketlistgoals
            erb :'bucketlistgoals/index'
        else
            flash[:error] = "Please Sign Up or Log In"
            redirect '/'
        end
    end

    #new action(view for a form that will create bucketlist)
    get '/bucketlistgoals/new' do 
        if logged_in?
            erb :'bucketlistgoals/new'
        else
            flash[:error] = "Please Sign Up or Log In"
            redirect '/'
        end
    end

    #create action
    post '/bucketlistgoals' do
        goals = current_user.bucketlistgoals.new(params)
        # binding.pry
        if goals.save 
            flash[:message] = "Created a goal succesfully!!"
            redirect "/bucketlistgoals"
        else
            flash[:error] = "Goal creation not succesful: Please fill in blank inputs"
            #{goals.errors.full_message.to_sentence} -- failed error implementation
            redirect "/bucketlistgoals/new"
        # redirect "/bucketlists/#{bucketlists.id}"
        end
    end


    #show action
    get '/bucketlistgoals/:id' do 
        if logged_in?
            @list = current_user.bucketlistgoals.find_by_id(params[:id])
            if @list
                erb :'bucketlistgoals/show'
            else
                redirect '/bucketlistgoals'
            end
        else
            redirect '/login'
        end
    end 


    #edit action(view for a form that will edit bucketlist)
    get '/bucketlistgoals/:id/edit' do 
        @list = current_user.bucketlistgoals.find_by_id(params[:id])
        erb :'bucketlistgoals/edit'
    end

    #update action
    patch '/bucketlistgoals/:id' do 
        params.delete(:_method)
        @list = current_user.bucketlistgoals.find_by_id(params[:id])
        @list.update(params)
        redirect '/bucketlistgoals'
    end

    #delete action
    delete '/bucketlistgoals/:id' do
        @list = current_user.bucketlistgoals.find_by_id(params[:id])
        @list.destroy
        redirect '/bucketlistgoals'
    end

end