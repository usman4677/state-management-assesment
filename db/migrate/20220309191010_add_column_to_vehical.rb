class AddColumnToVehical < ActiveRecord::Migration[6.1]
  def change
    add_column :vehicals, :state, :string
  end
end
