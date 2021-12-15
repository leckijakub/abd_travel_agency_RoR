class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[ show edit update destroy ]

  # GET /reservations or /reservations.json
  def index
    if !current_user.present? || current_user.role.class != Client
      respond_to do |format|
        format.html { redirect_to home_url, error: "Operation forbidden" }
        format.json { head :no_content }
      end
    else
      @reservations = Reservation.where(client_id: current_user.id)
    end
  end

  # GET /reservations/1 or /reservations/1.json
  def show
  end

  # GET /reservations/new
  def new
    @reservation = Reservation.new
  end

  # GET /reservations/1/edit
  def edit
  end

  # POST /reservations or /reservations.json
  def create
    if !current_user.present? || current_user.role.class != Client
      @offers = Offer.all
      respond_to do |format|
        format.html { redirect_to offers_url, error: "Operation forbidden" }
        format.json { head :no_content }
      end
    else
      puts "Creating reservation"
      @reservation = Reservation.new(client_id: current_user.role_id, offer_id: params[:offer_id], price: 10, status: "unapproved")
      puts "Reservation initalized"
      respond_to do |format|
        if @reservation.save
          format.html { redirect_to @reservation, notice: "Reservation was successfully created." }
          format.json { render :show, status: :created, location: @offer }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @reservation.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /reservations/1 or /reservations/1.json
  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to @reservation, notice: "Reservation was successfully updated." }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1 or /reservations/1.json
  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to reservations_url, notice: "Reservation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    # def reservation_params
    #   # params.permit(:offer_id)
    #   params.require(:reservation).permit(:price, :status, :client_id, :employee_id, :offer_id)
    # end
end
