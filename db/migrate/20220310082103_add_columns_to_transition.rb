class AddColumnsToTransition < ActiveRecord::Migration[6.1]
  def change
    add_column :transitions, :from, :string
    add_column :transitions, :to, :string
    add_column :transitions, :on, :string
  end
end
