class OffersController < ApplicationController
  before_action :set_offer, only: %i[ show edit update destroy ]

  # GET /offers or /offers.json
  def index
    @offers = Offer.all
  end

  # GET /offers/1 or /offers/1.json
  def show
  end

  # GET /offers/new
  def new
    @offer = Offer.new
  end

  # GET /offers/1/edit
  def edit
  end

  # POST /offers or /offers.json
  def create
    if !current_user.present? || current_user.role.class != Employee
      @offers = Offer.all
      respond_to do |format|
        format.html { redirect_to offers_url, error: "Operation forbidden" }
        format.json { head :no_content }
      end
    else
      @offer = Offer.new(ta_name: params['offer']['ta_name'], uid: params['offer']['uid'], transport: params['offer']['transport'], accomodation: params['offer']['accomodation'], event: params['offer']['event'], employee_id: current_user.role_id)
      respond_to do |format|
        if @offer.save
          format.html { redirect_to @offer, notice: "Offer was successfully created." }
          format.json { render :show, status: :created, location: @offer }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @offer.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /offers/1 or /offers/1.json
  def update
    if !current_user.present? || current_user.role.class != Employee
      @offers = Offer.all
      respond_to do |format|
        format.html { redirect_to offers_url, error: "Operation forbidden" }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        if @offer.update(offer_params)
          format.html { redirect_to @offer, notice: "Offer was successfully updated." }
          format.json { render :show, status: :ok, location: @offer }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @offer.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /offers/1 or /offers/1.json
  def destroy
    puts "Destroying Offer"
    puts current_user.present?
    if !current_user.present? || current_user.role.class != Employee
      @offers = Offer.all
      respond_to do |format|
        format.html { redirect_to offers_url, error: "Operation forbidden" }
        format.json { head :no_content }
      end
      # render :index, status: :forbidden
      # format.json { render json: @offer.errors, status: :forbidden }
    else
      @offer.destroy
      respond_to do |format|
        format.html { redirect_to offers_url, notice: "Offer was successfully destroyed." }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_offer
      @offer = Offer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def offer_params
      params.require(:offer).permit(:ta_name, :uid, :transport, :accomodation, :event)
    end
end
