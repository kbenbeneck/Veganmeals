class UsersController < ApplicationController
    get '/signup' do
        erb :"users/new"
    end

    post '/users' do
        
    #     user = User.create(name: params[:name], password: params[:password], email: params[:email])

    #     if user.save
            
    #         redirect '/login'
    #     else
    #         redirect '/login'
    #     end
    # end



    
        @user = User.new
        @user.name = params[:name]
        @user.email = params[:email]
        @user.password = params[:password]
        if @user.save
            redirect '/login'
        else
            redirect '/signup'
        end
    end
end


