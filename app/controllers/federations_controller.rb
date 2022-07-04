class FederationsController < ApplicationController
  before_action :set_federation, only: %i[ show edit update destroy ]

  # GET /federations or /federations.json
  def index
    @federations = Federation.all
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
  def create
    @federation = Federation.new(federation_params)

    respond_to do |format|
      if @federation.save
        format.html { redirect_to federation_url(@federation), notice: "Federation was successfully created." }
        format.json { render :show, status: :created, location: @federation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @federation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /federations/1 or /federations/1.json
  def update
    respond_to do |format|
      if @federation.update(federation_params)
        format.html { redirect_to federation_url(@federation), notice: "Federation was successfully updated." }
        format.json { render :show, status: :ok, location: @federation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @federation.errors, status: :unprocessable_entity }
      end
    end
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

    # Only allow a list of trusted parameters through.
    def federation_params
      params.require(:federation).permit(:name, :foundation_date)
    end
end
