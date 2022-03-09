class Api::V1::VehicalsController < ApplicationController

  before_action :set_user, only: [:index]
  before_action :set_vehical, only: [:update]

  def index
    @vehicals = @user.vehicals
    response = {status: :ok, vehicals: @vehicals}
    render :json => response
  end

  def create
    @vehical = Vehical.new(vehical_params)
    if @vehical.save
      response = {status: :ok, user_id: @vehical.user_id, name: @vehical.name}
    else
      response = {status: :bad_request, errors: @vehical.errors}
    end
    render :json => response
  end

  def update
    if @vehical.update(vehical_params)
      response = {status: :ok, user_id: @vehical.user_id, name: @vehical.name}
    else
      response = {status: :bad_request, errors: @vehical.errors}
    end
    render :json => response
  end
  
  private

  def set_vehical
    @vehical = Vehical.find_by_key(params[:vehical][:key])
  end

  def set_user
    @user = User.find(params[:user_id])
  end
  def vehical_params
    params.require(:vehical).permit(:name, :user_id, :key)
  end

end
