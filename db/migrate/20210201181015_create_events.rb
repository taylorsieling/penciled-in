class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.date :start_date
      t.date :end_date
      t.time :start_time
      t.time :end_time

      t.integer :user_id

      t.timestamps
    end
  end
end
