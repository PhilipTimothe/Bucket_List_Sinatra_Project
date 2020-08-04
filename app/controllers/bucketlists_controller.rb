class BucketListsController < ApplicationController

    #index action
    get '/bucketlists' do
        if logged_in?
            @bucketlist = current_user.bucketlists
            erb :'bucketlists/index'
        else
            redirect '/login'
        end
    end

    #new action(view for a form that will create bucketlist)
    get '/bucketlists/new' do 
        if logged_in?
            erb :'bucketlists/new'
        else
            redirect '/login'
        end
    end

    #create action
    post '/bucketlists' do
        current_user.bucketlists.create(params)
        redirect "/bucketlists"
        # redirect "/bucketlists/#{bucketlists.id}"
    end


    #show action
    get '/bucketlists/:id' do 
        if logged_in?
            @list = current_user.bucketlists.find_by_id(params[:id])
            @goals = @list.bucketlistgoals
            # binding.pry
            if @list
                erb :'bucketlistgoals/index'
            else
                redirect '/bucketlists'
            end
        else
            redirect '/login'
        end
    end 


    #edit action(view for a form that will edit bucketlist)
    get '/bucketlists/:id/edit' do 
        @list = current_user.bucketlists.find_by_id(params[:id])
        erb :'bucketlists/edit'
    end

    #update action
    patch '/bucketlists/:id' do 
        params.delete(:_method)
        @list = current_user.bucketlists.find_by_id(params[:id])
        @list.update(params)
        redirect '/bucketlists'
    end

    #delete action
    delete '/bucketlists/:id' do
        list = current_user.bucketlists.find_by_id(params[:id])
        list.destroy
        redirect '/bucketlists'
    end



end