class BidsController < ApplicationController
  def new
    @listing = Listing.find(params[:listing_id])
    @bid = Bid.new
  end

  def create
    @listing = Listing.find(params[:listing_id])
    @bid = @listing.bids.new(bid_params)
    @bid.user = current_user

    if @bid.save
      flash[:notice] = "New bid added."
      redirect_to @listing
    else
      flash.now[:alert] = "Something went wrong creating the bid."
      render :new
    end
  end

  private
  def bid_params
    params.require(:bid).permit(:price , :description, :image)
  end

end
