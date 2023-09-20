class ProfileController < ApplicationController
  # get current logged in user and their details
  before_action :authenticate_user!

  def index; end

  def order; end

  def reviews; end

  def wishlist; end

  def manage; end

end
