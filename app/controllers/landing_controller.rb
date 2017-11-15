class LandingController < ApplicationController
  def index
    @listings = Listing.all
  end

  def show
    @listing = Listing.find(params[:id])
    @user = User.find(params[:id])
  end
end
