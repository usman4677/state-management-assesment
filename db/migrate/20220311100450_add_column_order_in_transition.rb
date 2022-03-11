class AddColumnOrderInTransition < ActiveRecord::Migration[6.1]
  def change
    add_column :transitions, :state_order, :integer
  end
end
