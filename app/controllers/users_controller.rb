class UsersController < ApplicationController
    get '/signup' do
        erb :"users/new"
    end

    post '/users' do
        user = User.where(email:params[:user][:email])
        if @user.empty?
            @user = User.new(params[:user])
            if @user.save
                redirect '/login'
            else
                redirect '/signup'
            end
        end

    end



    
    #     @user = User.new
    #     @user.name = params[:name]
    #     @user.email = params[:email]
    #     @user.password = params[:password]
    #     if @user.save
    #         redirect '/login'
    #     else
    #         redirect '/signup'
    #     end
    # end
end


