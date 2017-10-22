class ListingsController < ApplicationController
  def index
    @listings = Listing.all
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = current_user.listings.new(listing_params)
 
    if @listing.save
      flash[:notice] = "New listing added."
      redirect_to @listing
    else
      flash.now[:alert] = "Something went wrong creating the listing."
      render :new
    end
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])
 
    @listing.assign_attributes(listing_params)
 
    if @listing.save
      flash[:notice] = "listing was updated."
      redirect_to @listing
    else
      flash.now[:alert] = "Error saving listing. Please try again."
      render :edit
    end
  end

  def destroy
    @listing = Listing.find(params[:id])
 
    if @listing.destroy
      flash[:notice] = "\"#{@listing.title}\" was deleted successfully."
      redirect_to action: :index
    else
      flash.now[:alert] = "There was an error deleting the listing."
      render :show
    end
  end

  # cant get these to work?
  private
  def listing_params
    params.require(:listing).permit(:title, :picture, :description, :location, :asking_price)
  end
end
