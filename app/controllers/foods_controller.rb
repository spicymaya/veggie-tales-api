class FoodsController < ApplicationController
    # protect_from_forgery with: :exception, unless: -> { request.format.json? }
    before_action :set_food, only: [:show, :update, :destroy]
    def index
        @foods = Food.all
        json_response(@foods)
    end

    def create
        @food = Food.create!(food_params)
        json_response(@food, 201)
        # render plain: params[:name]
    end
    
    def show
        # render plain: 'test'
        json_response(@food)
    end
    
    def update
        @food.update_attributes!(food_params)
        # json_response(@food, :no_content)
        head :no_content
    end
    
    def destroy
        @food.destroy
        head :no_content
    end    
    private
    def food_params
        params.permit(:name, :type, :region, :image_url, :rating)
    end
    def set_food
        @food = Food.find(params[:id]);
    end        
end
