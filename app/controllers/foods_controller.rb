class FoodsController < ApplicationController
    include ActionController::RequestForgeryProtection
    protect_from_forgery with: :exception, unless: -> { request.format.json? }
    def index
        @foods = Food.all
        json_response(@foods)
    end

    def create
        @food = Food.create!(food_params)
    end
    
    def show
        json_response(@foods)
    end
    
    def update
        @todo.update(food_params)
        head :no_content
    end
    
    def destroy
        @todo.destroy
        head :no_content
    end    
    private
    def food_params
        params.permit(:name, :region, :type, :rating, :image_url)
    end    
end
