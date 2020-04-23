class UsersController < ApplicationController
    get '/signup' do
        @user = User.new
        erb :"users/new"
    end

    post '/users' do
        @user = User.new
        @user.name = params[:name]
        @user.email = params[:email]
        @user.password = params[:password]
        if @user.save
            session[:user_id] = @user.id
            redirect '/meals'
        else
            erb :"users/new"
        end
    end
end


