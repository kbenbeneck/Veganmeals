require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "meal_secret"
  end

  get "/" do
    erb :welcome
  end

  helpers do
    
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      @user ||= User.find_by_id(session[:user_id]) if logged_in?
    end

    def redirect_if_not_owner
      if current_user.id != @meal.user_id
        redirect '/meals'
      end 
    end




  end

end
