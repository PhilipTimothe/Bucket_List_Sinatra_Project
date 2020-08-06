class BucketListGoalsController < ApplicationController

    #index action
    get '/bucketlistgoals' do
        if logged_in?
            @bucketlistgoal = current_user.bucketlistgoals
            erb :'bucketlistgoals/index'
        else
            redirect '/login'
        end
    end

    #new action(view for a form that will create bucketlist)
    get '/bucketlistgoals/new' do 
        if logged_in?
            erb :'bucketlistgoals/new'
        else
            redirect '/login'
        end
    end

    #create action
    post '/bucketlistgoals' do
        goals = current_user.bucketlistgoals.build(params)
        goals.completed = false
        goals.save
        redirect "/bucketlistgoals"
        # redirect "/bucketlists/#{bucketlists.id}"
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