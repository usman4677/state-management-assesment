class CreateVehicals < ActiveRecord::Migration[6.1]
  def change
    create_table :vehicals do |t|
      t.string :name
      t.string :key
      t.timestamps
    end
  end
end
