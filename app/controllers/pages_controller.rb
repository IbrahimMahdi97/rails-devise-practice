class PagesController < ApplicationController
  before_action :authenticate_user!
  
  def show
    # redirect_to '/albums/:id'
  end

  
  def home
    @user = current_user
    redirect_to /albums/:id
  end
end
