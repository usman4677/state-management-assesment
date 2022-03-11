class Api::V1::VehicalsController < ApplicationController

  before_action :set_user, only: [:index]
  before_action :set_vehical, only: [:update]
  before_action :get_vehical, only: [:state_transition]
  before_action :set_transitions, only: [:update_transitions]

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

  def get_transitions
    transitions = Transition.get_all_transitions
    response = {status: :ok, transitions: transitions}
    render :json => response
  end

  def update_transitions
    from_state_order = @from_transition.state_order
    to_state_order = @to_transition.state_order
    @to_transition.update(state_order: from_state_order)
    @from_transition.update(state_order: to_state_order)
    response = {status: :ok, transitions: Transition.get_all_transitions , msg: 'States order updated successfully.'}
    render :json => response
  end

  def state_transition
    return unless @vehical.present?
    msg = @vehical.machine.move ? 'State updated' : 'State not update'
    @vehical.save
    response = {status: :ok, vehical: @vehical, message: msg}
    render :json => response
  end
  
  private

  def set_vehical
    @vehical = Vehical.find_by_key(params[:vehical][:key])
  end

  def set_transitions
    @from_transition = Transition.find(params[:from])
    @to_transition = Transition.find(params[:to])
  end

  def get_vehical
    @vehical = Vehical.find_by_key(params[:key])
  end

  def set_user
    @user = User.find(params[:user_id])
  end
  def vehical_params
    params.require(:vehical).permit(:name, :user_id, :key)
  end

end
