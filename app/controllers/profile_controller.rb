class ProfileController < ApplicationController
  # get current logged in user and their details
  before_action :authenticate_user!

  def index


  end

end
