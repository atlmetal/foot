class ClubsController < ApplicationController

  rescue_from Exception do |e|
    render json: { error: e.message }, status: :internal_error
  end

  rescue_from ActiveRecord::RecordInvalid do |e|
    render json: { error: e.message }, status: :unprocessable_entity
  end

  before_action :set_club, only: %i[ show edit update destroy ]

  # GET /clubs or /clubs.json
  def index
    @clubs = Club.all
    if !params[:search].nil? && params[:search].present?
      @clubs = ClubsSearchService.search(@clubs, params[:search])
    end
    render json: @clubs.includes(:federation), status: :ok
  end

  # GET /clubs/1 or /clubs/1.json
  def show
    @club = Club.find(params[:id])
    render json: @club, status: :ok
  end

  # GET /clubs/new
  def new
    @club = Club.new
  end

  # GET /clubs/1/edit
  def edit
  end

  # POST /clubs or /clubs.json
  # def create
  #   @club = Club.new(club_params)

  #   respond_to do |format|
  #     if @club.save
  #       format.html { redirect_to club_url(@club), notice: "Club was successfully created." }
  #       format.json { render :show, status: :created, location: @club }
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #       format.json { render json: @club.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def create
    @club = Club.create!(create_params)
    render json: @club, status: :created
  end

  # PATCH/PUT /clubs/1 or /clubs/1.json
  # def update
  #   respond_to do |format|
  #     if @club.update(club_params)
  #       format.html { redirect_to club_url(@club), notice: "Club was successfully updated." }
  #       format.json { render :show, status: :ok, location: @club }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @club.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def update
    @club = Club.find(params[:id])
    @club.update!(update_params)
    render json: @club, status: :ok
  end

  # DELETE /clubs/1 or /clubs/1.json
  def destroy
    @club.destroy

    respond_to do |format|
      format.html { redirect_to clubs_url, notice: "Club was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_club
      @club = Club.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def create_params
      params.require(:club).permit(:name, :foundation_date, :federation_id)
    end

    def update_params
      params.require(:club).permit(:name, :foundation_date)
    end
end
