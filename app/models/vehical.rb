class Vehical < ApplicationRecord
  belongs_to :user
  # attr_accessor :state

  def initialize(*)
    super
    machine
  end

  def transitions
    transitions_data = []
    @transitions = Transition.all.order(state_order: :asc)
    @transitions.each_with_index do |transition, index|
      transitions_data << { transition.from.to_sym => @transitions[index+1].from.to_sym, :on => :move }  if index != @transitions.size - 1
    end
    
    transitions_data
  end

  def machine
    vehicle = self
    @machine ||= Machine.new(vehicle, initial: (vehicle.state&.to_sym || :Assembled), action: :saved) do
      vehicle.transitions.each {|attrs| transition(attrs)}
    end
  end

  def saved
    true
  end

  # state_machine :state, initial: :parked do
  #   event :ignite do
  #     transition parked: :moved
  #   end
  # end
  # end

  
  # def set_initial_status
  #   self.state ||= :parked
  # end
end
