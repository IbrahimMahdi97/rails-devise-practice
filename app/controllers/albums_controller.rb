class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :edit, :update, :destroy]
  # before_action :authenticate_user!, except: [:show, :index]
  # GET /albums
  # GET /albums.json
  def index
    @albums = Albums.all
  end

  # GET /albums/1
  # GET /albums/1.json
  def show
    @album = Albums.find(params[:id]) 
    binding.pry
    @imaage = Imaage.where(albums_id: @album.id)
    binding.pry
    
  end

  # def show_image
  #   @album = Albums.find(params[:id])
  #   send_data @album.image, :type => 'image/jpeg',:disposition => 'inline'
  # end


  # GET /albums/new
  def new
    @album = Albums.new
    @album.user = current_user
    
    binding.pry
    
    # @imaage = Imaage.create!(albums_id: @album.id)
    # @album.images.attach(params[:images])
  end

  # GET /albums/1/edit
  def edit
    @album = Albums.find(params[:id])
    @imaage = Imaage.where(albums_id: @album.id)
  end

  # POST /albums
  # POST /albums.json
  def create
    @album = Albums.create(album_params)
    @album.user = current_user
    respond_to do |format|
      if @album.save!
        
        binding.pry
        
        # TODO : Refactor Cross Model
        @imaage = Imaage.create!(albums_id: @album.id)
        format.html { redirect_to @album, notice: 'Albums was successfully created.' }
        format.json { render :show, status: :created, location: @album }
      else
        format.html { render :new }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
      
    end
   
  end

  # PATCH/PUT /albums/1
  # PATCH/PUT /albums/1.json
  def update
    @album = Albums.find(params[:id])
    
    respond_to do |format|
      if @album.update!(album_params)
        format.html { redirect_to @album, notice: 'Albums was successfully updated.' }
        format.json { render :show, status: :ok, location: @album }
      else
        format.html { render :edit }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /albums/1
  # DELETE /albums/1.json
  def destroy
    @album.destroy(params[:id])
    respond_to do |format|
      format.html { redirect_to albums_show_url, notice: 'Albums was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album
      @album = Albums.where(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def album_params
      params.require(:album).permit(:title, :user_id, :id, :image, :imaages)
    end
end
