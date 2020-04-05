class MealsController < ApplicationController
    
    get '/meals' do
        if logged_in?
            @user = current_user
            @meals = @user.meals 
            erb :"meals/index"
        else
            redirect '/login'
        end
    end
        
    get '/meals/new' do
        erb :"/meals/new"
    end

    get '/meals/:id' do
        #id = params[:id]
        find_meal
        if @meal
            erb :"meals/show"
        else
            redirect '/meals'
        end
    end

    post '/meals' do
        meals = Meal.where(name:params[:meal][:name])
        if meals.empty?
            meal = Meal.new(params[:meal])
            if meal.save
                redirect "/meals/#{meal.id}"
            else
                redirect "/meals/new"
            end
        end
    end

    get '/meals/:id/edit' do
        find_meal
        if @meal
            erb :"meals/edit"
        else
            redirect '/meals'
        end

    end

    patch '/meals/:id' do
        find_meal

        if @meal.update(params[:meal])
            redirect "/meals/#{@meal.id}"
        else
            redirect "/meals/#{@meal.id}/edit"
        end
    end

    delete '/meals/:id' do
        find_meal
        if @meal.destroy
            redirect '/meals'
        else
            redirect "/meals/#{@meal.id}"
        end

    end

    private

    def find_meal
        @meal = Meal.find_by_id(params[:id])
    end


end


#     get '/meals' do
#         if logged_in?   
#             @user = current_user
#             @meals = @user.meals 
#             erb :"meals/index"
            
#         else
#             redirect '/login'
#         end
#     end
    
#     get '/meals/new' do

#         erb :"meals/new"
#     end

#     get '/meals/:id' do
#         find_meal
#         if @meal
#             erb :"meals/show"
#         else
#             redirect '/meals'
#         end
        
#     end

#     post '/meals' do
#         meals = Meal.where(name:params[:meal][:name])
#         if meals.empty?
#             meal = Meal.new(params[:meal])
#             if meal.save
#                 redirect "/meals/#{@meal.id}"
#             else
#                 redirect "/meals/new"
#             end
#         else
#             redirect "/meals/new"
#         end


#     end
    
#     get '/meals/:id/edit' do
#         find_meal
#         if @meal
#             erb :"meals/edit"
#         else
#             redirect '/meals'
#         end
#     end

#     patch '/meals/:id' do
#         find_meal
#         if @meal.update(params[:meal])
#             redirect "/meals/#{@meal.id}"
#         else
#             redirect "/meals/#{@meal.id}/edit"
#         end
#     end

#     delete '/meals/:id' do
#         find_meal
#         if @meal.destroy
#             redirect '/meals'
#         else
#             redirect "/meals/#{@meal.id}"
#         end

#     end
# private

#     def find_meal
#         @meal = Meal.find_by_id(params[:id])
#     end


# end
