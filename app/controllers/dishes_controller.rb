class DishesController < ApplicationController
  def index
    @dishes = Dish.all
  end

  def show
    @dish = Dish.find(params[:id])
    @dish_cuisine = Cuisine.find_by({:id => @dish.cuisine_id}).name
    @dish_favvenues = Favorite.where({:dish_id => @dish.id})
    @dish_favusers = User.where({:id => @dish_favvenues})
  end

  def new_form
  end

  def create_row
    @dish = Dish.new
    @dish.name = params[:name]
    @dish.cuisine_id = params[:cuisine_id]

    @dish.save

    render('show')
  end

  def edit_form
    @dish = Dish.find(params[:id])
  end

  def update_row
    @dish = Dish.find(params[:id])

    @dish.name = params[:name]
    @dish.cuisine_id = params[:cuisine_id]
    @dish_cuisine = Cuisine.find_by({:id => @dish.cuisine_id}).name
    @dish_favvenues = Favorite.where({:dish_id => @dish.id})
    @dish_favusers = User.where({:id => @dish_favvenues})

    @dish.save

    render('show')
  end

  def destroy
    @dish = Dish.find(params[:id])

    @dish.destroy
  end
end
