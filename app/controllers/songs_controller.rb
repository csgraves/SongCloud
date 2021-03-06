class SongsController < ApplicationController
  #find album, song and authenticate user
  before_action :set_song, only: [:show, :edit, :update, :destroy]
  before_action :set_album, only: [:new, :create]
  before_action :authenticate_user!

  #DRY methods
  # GET /songs
  # GET /songs.json
  #Implement scope
  def index
    @songs = Song.user_songs(current_user)
  end

  # GET /songs/1
  # GET /songs/1.json
  def show
  end

  # GET /songs/new
  def new
    @song = @album.songs.new
  end

  # GET /songs/1/edit
  def edit
  end

  # POST /songs
  # POST /songs.json
  def create
    @song = @album.songs.new(song_params)

    respond_to do |format|
      if @song.save
        format.html { redirect_to @song, notice: t('.new') }
        format.json { render :show, status: :created, location: @song }
      else
        format.html { render :new }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /songs/1
  # PATCH/PUT /songs/1.json
  def update
    respond_to do |format|
      if @song.update(song_params)
        format.html { redirect_to @song, notice: t('.edit') }
        format.json { render :show, status: :ok, location: @song }
      else
        format.html { render :edit }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /songs/1
  # DELETE /songs/1.json
  def destroy
    @song.destroy
    respond_to do |format|
      format.html { redirect_to songs_url, notice: t('.remove') }
      format.js { flash[:notice] = t('.remove') } #handle JS
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album
      @album = Album.find_by(id: params[:album_id]) || Album.find(song_params[:album_id])
    end


    def set_song
      @song = Song.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def song_params
      params.require(:song).permit(:album_id, :title, :artist, :genre, :favourite)
    end
end
