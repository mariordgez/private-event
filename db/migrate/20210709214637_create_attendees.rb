class CreateAttendees < ActiveRecord::Migration[6.1]
  def change
    create_table :attendees do |t|
      t.references :user, foreign_key: true
      t.references :event, foreign_key: true
      t.string :userame
      t.timestamps
    end
  end
end
