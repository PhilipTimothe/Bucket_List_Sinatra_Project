class BucketListGoalsController < ApplicationController

    #index action
    get '/bucketlistgoals' do
        # if logged_in?
        #     @goals = current_user.bucketlists.bucketlistgoals
        #     @bucketlist = current_user.bucketlists
        #     erb :'bucketlistgoals/index'
        # else
        #     redirect '/login'
        # end
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
        
        # redirect "/bucketlists/"
        redirect "/bucketlists/#{bucketlists.id}"
    end


    #show action
    # get '/bucketlistgoals/:id' do 
    #     if logged_in?
    #         @goal = current_user.bucketlists.bucketlistgoals.find_by_id(params[:id])
    #         if @goal
    #             erb :'bucketlists/show'
    #         else
    #             redirect "/bucketlists/#{bucketlistgoals.bucketlist_id}"
    #         end
    #     else
    #         redirect '/login'
    #     end
    # end 


    #edit action(view for a form that will edit bucketlist)
    get '/bucketlistgoals/:id/edit' do 
        list = current_user.bucketlists
        @goal = list.bucketlistgoals.find_by_id(params[:id])
        erb :'bucketlistgoals/edit'
    end

    #update action
    patch '/bucketlistgoals/:id' do 
        params.delete(:_method)
        list = current_user.bucketlists
        @goal = list.bucketlistgoals.find_by_id(params[:id])
        @goal.update(params)
        redirect "/bucketlists/#{bucketlistgoals.bucketlist_id}"
    end

    #delete action
    delete '/bucketlistgoals/:id' do
        list = current_user.bucketlists
        goal = list.bucketlistgoals.find_by_id(params[:id])
        goal.destroy
        redirect "/bucketlists/#{bucketlistgoals.bucketlist_id}"
    end



end