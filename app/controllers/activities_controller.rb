class ActivitiesController < ApplicationController
  before_action :set_activities, only: %i[show update destroy]

  # GET /activitiess
  def index
    @activitiess = Activity.all

    render json: @activitiess
  end

  # GET /activitiess/1
  def show
    render json: @activities
  end

  # POST /activitiess
  def create
    @activities = Activity.new(activities_params)

    if @activities.save
      render json: @activities, status: :created, location: @activities
    else
      render json: @activities.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /activitiess/1
  def update
    if @activities.update(activities_params)
      render json: @activities
    else
      render json: @activities.errors, status: :unprocessable_entity
    end
  end

  # DELETE /activitiess/1
  def destroy
    @activities.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_activities
    @activities = Activity.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def activities_params
    params.require(:activity).permit(
      :name,
      :shift
    )
  end
end
