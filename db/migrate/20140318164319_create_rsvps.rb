class CreateRsvps < ActiveRecord::Migration
  def change
    create_table :rsvps do |t|
      t.references :user, index: true
      t.references :event, index: true

      t.timestamps
    end
  end
end
