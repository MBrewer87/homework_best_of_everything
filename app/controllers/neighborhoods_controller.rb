class NeighborhoodsController < ApplicationController
  def index
    @neighborhoods = Neighborhood.all
  end

  def show
    @neighborhood = Neighborhood.find(params[:id])
    @neighborhood_venues = Venue.where({:neighborhood_id => @neighborhood.id})
  end

  def new_form
  end

  def create_row
    @neighborhood = Neighborhood.new
    @neighborhood.name = params[:name]
    @neighborhood.city = params[:city]

    @neighborhood.save

    render('show')
  end

  def edit_form
    @neighborhood = Neighborhood.find(params[:id])
    @neighborhood_venues = Venue.where({:neighborhood_id => @neighborhood.id})
  end

  def update_row
    @neighborhood = Neighborhood.find(params[:id])

    @neighborhood.name = params[:name]
    @neighborhood.city = params[:city]
    @neighborhood_venues = Venue.where({:neighborhood_id => @neighborhood.id})

    @neighborhood.save

    render('show')
  end

  def destroy
    @neighborhood = Neighborhood.find(params[:id])

    @neighborhood.destroy
  end
end
