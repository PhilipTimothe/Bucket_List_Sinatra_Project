class BucketListsController < ApplicationController

    #index action
    get '/bucketlists' do

        @bucketlist = current_user.bucketlists
        erb :'bucketlists/index'
    end

    #new action(view for a form that will create bucketlist)
    get '/bucketlists/new' do 
        erb :'bucketlists/new'
    end

    #create action
    post '/bucketlists' do
        current_user.bucketlists.create(params)
        
        redirect "/bucketlists/#{bucketlists.id}"
    end


    #show action
    get '/bucketlists/:id' do 
        @list = current_user.bucketlists.find_by_id(params[:id])
        if @list
            erb :'bucketlists/show'
        else
            redirect '/bucketlists'
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