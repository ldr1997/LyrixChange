class BandsController < ApplicationController
  before_action :user_logged_in, :set_band, only: [:show, :edit, :update, :destroy]

  # GET /bands
  # GET /bands.json
  def index
    user_logged_in
    @bands = Band.all
  end

  # GET /bands/1
  # GET /bands/1.json
  def show
  end

  # GET /bands/new
  def new
    @band = Band.new
  end

  # GET /bands/1/edit
  def edit
  end

  # POST /bands
  # POST /bands.json
  def create
    @band = current_user.bands.new(band_params)
    user_ids = params[:band][:user_ids]
    params[:band].delete :user_ids

    @band.users << current_user

    for user_id in user_ids do
      if user_id != ""
        temp_user = User.find(user_id)
        temp_user.bands << @band
        # @band.users << temp_user
      end
    end

    respond_to do |format|
      if @band.save
        format.html { redirect_to @band, notice: 'Band was successfully created.' }
        format.json { render :show, status: :created, location: @band }
      else
        format.html { render :new }
        format.json { render json: @band.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /bands/1
  # PATCH/PUT /bands/1.json
  def update
    user_ids = params[:band][:user_ids]
    params[:band].delete :user_ids

    # Update all band-user associations
    for user in User.all do
      if (user_ids.include?(user.id.to_s)) then
        user.bands.find_by(id: @band.id) || user.bands << @band
      else
        user.bands.delete(@band)
      end
    end

    respond_to do |format|
      if @band.update(band_params)
        format.html { redirect_to @band, notice: 'Band was successfully updated.' }
        format.json { render :show, status: :ok, location: @band }
      else
        format.html { render :edit }
        format.json { render json: @band.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bands/1
  # DELETE /bands/1.json
  def destroy
    @band.destroy
    respond_to do |format|
      format.html { redirect_to bands_url, notice: 'Band was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_band
      @band = Band.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def band_params
      params.require(:band).permit(:name, :description, :genres)
    end
end
