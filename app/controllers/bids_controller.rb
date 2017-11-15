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

  def confirm
    @listing = Listing.find(params[:listing_id])
    @listing.confirmed_bid = @listing.bids.find(params[:id])

    if @listing.save
      flash[:notice] = "Confimed Bid!."
    else
      flash.now[:alert] = "Something went wrong confirming the bid."
    end
    redirect_to @listing
  end

  private
  def bid_params
    params.require(:bid).permit(:price , :description, :image)
  end

end
