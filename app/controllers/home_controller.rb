class HomeController < ApplicationController
  def index
    redirect_to feeds_url if current_user
  end
end
