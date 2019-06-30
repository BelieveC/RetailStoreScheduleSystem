class CreateStoreShifts < ActiveRecord::Migration[5.2]
  def change
    create_table :store_shifts do |t|
      t.string :start, null: false
      t.string :finish, null: false
      t.integer :day_of_week
      t.integer :duration
      t.integer :store_routine_id, null: false
      t.timestamps
    end
  end
end
