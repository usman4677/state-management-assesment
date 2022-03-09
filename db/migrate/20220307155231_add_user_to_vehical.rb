class AddUserToVehical < ActiveRecord::Migration[6.1]
  def change
    add_reference :vehicals, :user, foreign_key: true,  index: true
  end
end
