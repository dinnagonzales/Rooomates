class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :cleanliness
      t.integer :noise_tolerance
      t.integer :visitors
      t.integer :pets
      t.integer :smoking
      t.integer :sleeping_hours
      t.integer :cooks
      t.integer :lifestyle
      t.text :interests
      t.text :notes


      t.timestamps
  end
      
  end
end
