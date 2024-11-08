class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_organization, only: [:create]

  def index
    @favorites = @current_user.favorites.includes(:organization)
    Rails.logger.info "Favorites for user #{@current_user.username}: #{@favorites.inspect}"
  end

  def create
    Rails.logger.info "Current user: #{@current_user.inspect}" # Debug line
    Rails.logger.info "Create action called for favoriting"
    @favorite = @current_user.favorites.new(organization: @organization)

    Rails.logger.info "Trying to save favorite: #{@favorite.inspect}"

    if @favorite.save
      flash[:notice] = "Added to favorites!"
      redirect_to favorites_path
    else
      flash[:alert] = "Unable to add to favorites."
      redirect_to request.referer || root_path
    end
  end

  private

  def set_organization
    # Ensure the organization is correctly set based on the ID parameter
    @organization = Organization.find_by(id: params[:favorite][:organizationID_id])
    Rails.logger.info "Organization to add: #{@organization.inspect}"

    unless @organization
      flash[:alert] = "Organization not found."
      redirect_to root_path
    end
  end
end
