class DesignsController < ApplicationController
  before_action :set_design, only: [:show, :update, :destroy]

  # GET /designs
  def index
    @designs = Design.all

    render json: @designs
  end

  # GET /designs/1
  def show
    render json: @design
  end

  # POST /designs
  def create
    @design = Design.new(design_params)

    if @design.save
      render json: @design, status: :created, location: @design
    else
      render json: @design.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /designs/1
  def update
    if @design.update(design_params)
      render json: @design
    else
      render json: @design.errors, status: :unprocessable_entity
    end
  end

  # DELETE /designs/1
  def destroy
    @design.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_design
      @design = Design.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def design_params
      params.require(:design).permit(:name, :garden_id)
    end
end
