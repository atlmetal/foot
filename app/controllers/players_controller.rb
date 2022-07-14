class PlayersController < ApplicationController
  include Secured
  before_action :authenticate_user!, only: [:create, :update, :destroy]

  rescue_from Exception do |e|
    render json: { error: e.message }, status: :internal_error
  end

  rescue_from ActiveRecord::RecordInvalid do |e|
    render json: { error: e.message }, status: :unprocessable_entity
  end

  before_action :set_player, only: %i[ show edit update destroy ]

  # GET /players or /players.json
  def index
    @players = Player.all
        if !params[:search].nil? && params[:search].present?
          @players = PlayersSearchService.search(@players, params[:search])
        end
    render json: @players.includes(:club), status: :ok
  end

  # GET /players/1 or /players/1.json
  def show
    @player = Player.find(params[:id])
    render json: @player, status: :ok
  end

  # GET /players/new
  def new
    @player = Player.new
  end

  # GET /players/1/edit
  def edit
  end

  # POST /players or /players.json
  # def create
  #   @player = Player.new(create_params)

  #   respond_to do |format|
  #     if @player.save
  #       format.html { redirect_to player_url(@player), notice: "Player was successfully created." }
  #       format.json { render :show, status: :created, location: @player }
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #       format.json { render json: @player.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def create
    @player = Current.user.players.create!(create_params)
    render json: @player, status: :created
  end

  # PATCH/PUT /players/1 or /players/1.json
  # def update
  #   respond_to do |format|
  #     if @player.update(update_params)
  #       format.html { redirect_to player_url(@player), notice: "Player was successfully updated." }
  #       format.json { render :show, status: :ok, location: @player }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @player.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def update
    @player = Current.user.players.find(params[:id])
    @player.update!(update_params)
    render json: @player, status: :ok
  end

  # DELETE /players/1 or /players/1.json
  def destroy
    @player.destroy

    respond_to do |format|
      format.html { redirect_to players_url, notice: "Player was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_player
    @player = Player.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def create_params
    params.require(:player).permit(:name, :birth_date, :value)
  end

  def update_params
    params.require(:player).permit(:name, :birth_date, :value)
  end
end
