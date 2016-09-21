class CreateInvites < ActiveRecord::Migration[5.0]
  def change
    create_table :invites do |t|
    	t.references :attendee
    	t.references :attended_event

      t.timestamps
    end
  end
end
