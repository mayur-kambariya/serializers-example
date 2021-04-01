class ImportantDatesController < ApplicationController

  def index
    important_dates = ImportantDate.all
    render json: important_dates
  end 

  def create
    important_date = ImportantDate.create(important_date_params)
    render json: important_date 
  end

  def show
    important_date = ImportantDate.find(params[:id])
    render json: important_date
  end

  def update
    important_date = ImportantDate.find(params[:id])
    important_date.update(important_date_params)
    render json: important_date
  end

  def destroy
    important_date = ImportantDate.find(params[:id])
    important_date.destroy
    render json: important_date
  end

  private

  def important_date_params
    params.require(:important_date).permit(:title, :date, :user_id, :friend_id, :reminder, :note)
  end 
  
end
