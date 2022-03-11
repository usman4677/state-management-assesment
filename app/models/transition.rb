class Transition < ApplicationRecord
  def self.get_all_transitions
    Transition.all.order(state_order: :asc)
  end
end
