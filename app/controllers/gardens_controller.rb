class GardensController < ApplicationController
  before_action :set_garden, only: [:show, :update, :destroy]
  skip_before_action :authenticate_user!, except: [:update, :create, :destroy]

  # GET /gardens
  def index
    @gardens = Garden.all

    render json: @gardens
  end

  # GET /gardens/1
  def show
    render json: @garden
    # include: ['comments.user']
  end

  # POST /
  def create
    @garden = Garden.new(garden_params)
    @garden.user = current_user

    if @garden.save
      render json: @garden, status: :created, location: @garden
    else
      render json: @garden.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /gardens/1
  def update
    if @garden.user == current_user
      if @garden.update(garden_params)
        render json: @garden
      else
        render json: @garden.errors, status: :unprocessable_entity
      end
    end
  end

  # DELETE /gardens/1
  def destroy
    if @garden.user == current_user || !@garden.user
      @garden.destroy
    else
      render json: { errors: ["Unauthorized"] }, status: 401
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_garden
    @garden = Garden.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def garden_params
    params.permit(:title, :description, :date, :user_id)
  end
end
