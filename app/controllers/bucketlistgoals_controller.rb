class BucketListGoalsController < ApplicationController

    #index action
    get '/bucketlistgoals' do
        if logged_in?
            @goals = current_user.bucketlists.bucketlistgoals
            erb :'bucketlistgoals/index'
        else
            redirect '/login'
        end
    end
    #continue tomorroowwwww today's date Aug 3 2020

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
            if @list
                erb :'bucketlists/show'
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