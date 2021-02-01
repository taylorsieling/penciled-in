class CreateRsvps < ActiveRecord::Migration[6.1]
  def change
    create_table :rsvps do |t|
      t.string :status
      t.integer :number_of_attendee

      t.timestamps
    end
  end
end
