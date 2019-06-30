class StoreRoutinesController < ApplicationController
  before_action :set_store_routine, only: [:show, :update, :destroy]

  # GET /store_routines
  def index
    @store_routines = StoreRoutine.all

    render json: @store_routines
  end

  # GET /store_routines/1
  def show
    render json: @store_routine
  end

  # POST /store_routines
  def create
    @store_routine = StoreRoutine.new(store_routine_params)

    if @store_routine.save
      render json: @store_routine, status: :created, location: @store_routine
    else
      render json: @store_routine.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /store_routines/1
  def update
    if @store_routine.update(store_routine_params)
      render json: @store_routine
    else
      render json: @store_routine.errors, status: :unprocessable_entity
    end
  end

  # DELETE /store_routines/1
  def destroy
    @store_routine.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store_routine
      @store_routine = StoreRoutine.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def store_routine_params
      params.require(:store_routine).permit(:name, :description)
    end
end