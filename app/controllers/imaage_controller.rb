class ImaageController < ApplicationController
  def index
    @imaages = Imaage.all
  end

  def new
    @imaage = Imaage.new
  end
  
  # def create
  #   @imaage = Imaage.create!(imaage_params)
  #   @imaage.save!
  # end

  def update
  end

  private
  def imaage_params
    params.require(:imaage).permit(:image, :albums_id)
  end
end
