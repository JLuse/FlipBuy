class ListingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @listings = Listing.where(confirmed_bid_id: nil)
  end

  def show
    @listing = Listing.find(params[:id])
    @bid = Bid.new
    @bids = Bid.all
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
    authorize @listing
  end

  def update
    @listing = Listing.find(params[:id])
    authorize @listing
 
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
    authorize @listing
 
    if @listing.destroy
      flash[:notice] = "\"#{@listing.title}\" was deleted successfully."
      redirect_to action: :index
    else
      flash.now[:alert] = "There was an error deleting the listing."
      render :show
    end
  end

  def confirm_bid
    @listing = Listing.find(params[:id])
    @listing.confirmed_bid = Bid.find(params[:bid_id])

    if @listing.save
      flash[:notice] = "Bid was confirmed."
    else
      flash.now[:alert] = "Error saving confirmed bid. Please try again."
    end
    redirect_to @lisitng
  end

  private
  def listing_params
    params.require(:listing).permit(:title, :image, :description, :location, :asking_price)
  end
end
