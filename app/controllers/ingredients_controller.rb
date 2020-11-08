class IngredientsController < ApplicationController
    before_action :find_ingredient, only: [:show, :edit, :update]
    def new
        @ingredient = Ingredient.new 
        render :new 
    end

    def create
        ingredient = Ingredient.create(ingredient_params)
        redirect_to ingredient_path(ingredient)
    end

    def show
     render :show
    end

    def edit
        render :edit
    end

    def update
        @ingredient.update(ingredient_params)
        redirect_to ingredient_path(@ingredient)
    end

    private

    def ingredient_params
        params.require(:ingredient).permit(:name)
    end

    def find_ingredient
        @ingredient = Ingredient.find(params[:id])
    end
end