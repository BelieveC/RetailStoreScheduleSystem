class StoreShiftsController < ApplicationController
  before_action :set_store_shift, only: [:show, :update, :destroy]

  # GET /store_shifts
  def index
    @store_shifts = StoreShift.all

    render json: @store_shifts
  end

  # GET /store_shifts/1
  def show
    render json: @store_shift
  end

  # POST /store_shifts
  def create
    @store_shift = StoreShift.new(store_shift_params)

    if @store_shift.save
      render json: @store_shift, status: :created, location: @store_shift
    else
      render json: @store_shift.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /store_shifts/1
  def update
    if @store_shift.update(store_shift_params)
      render json: @store_shift
    else
      render json: @store_shift.errors, status: :unprocessable_entity
    end
  end

  # DELETE /store_shifts/1
  def destroy
    @store_shift.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store_shift
      @store_shift = StoreShift.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def store_shift_params
      params.require(:store_shift).permit(:start, :finish, :duration, :day_of_week, :store_routine_id)
    end
end