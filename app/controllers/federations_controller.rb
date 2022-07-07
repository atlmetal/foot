class FederationsController < ApplicationController

  rescue_from Exception do |e|
    render json: { error: e.message }, status: :internal_error
  end

  rescue_from ActiveRecord::RecordInvalid do |e|
    render json: { error: e.message }, status: :unprocessable_entity
  end

  before_action :set_federation, only: %i[ show edit update destroy ]

  # GET /federations or /federations.json
  def index
    @federations = Federation.all
    if !params[:search].nil? && params[:search].present?
      @federations = FederationsSearchService.search(@federations, params[:search])
    end
    render json: @federations, status: :ok
  end

  # GET /federations/1 or /federations/1.json
  def show
    @federation = Federation.find(params[:id])
    render json: @federation, status: :ok
  end

  # GET /federations/new
  def new
    @federation = Federation.new
  end

  # GET /federations/1/edit
  def edit
  end

  # POST /federations or /federations.json
  # def create
  #   @federation = Federation.new(federation_params)

  #   respond_to do |format|
  #     if @federation.save
  #       format.html { redirect_to federation_url(@federation), notice: "Federation was successfully created." }
  #       format.json { render :show, status: :created, location: @federation }
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #       format.json { render json: @federation.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def create
    @federation = Federation.create!(create_params)
    render json: @federation, status: :created
  end

  # PATCH/PUT /federations/1 or /federations/1.json
  # def update
  #   respond_to do |format|
  #     if @federation.update(federation_params)
  #       format.html { redirect_to federation_url(@federation), notice: "Federation was successfully updated." }
  #       format.json { render :show, status: :ok, location: @federation }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @federation.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def update
    @federation = Federation.find(params[:id])
    @federation.update!(update_params)
    render json: @federation, status: :ok
  end

  # DELETE /federations/1 or /federations/1.json
  def destroy
    @federation.destroy

    respond_to do |format|
      format.html { redirect_to federations_url, notice: "Federation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_federation
      @federation = Federation.find(params[:id])
    end

    def create_params
      params.require(:federation).permit(:name, :foundation_date)
    end

    # Only allow a list of trusted parameters through.
    def update_params
      params.require(:federation).permit(:name, :foundation_date)
    end
end
