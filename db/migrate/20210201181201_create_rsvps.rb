class CreateRsvps < ActiveRecord::Migration[6.1]
  def change
    create_table :rsvps do |t|
      t.string :status
      t.integer :number_of_attendees

      t.integer :user_id
      t.integer :event_id

      t.timestamps
    end
  end
end
