class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :age
      t.string :gender
      t.string :city
      t.string :state
      t.integer :cleanliness
      t.integer :noise_tolerance
      t.integer :visitors
      t.integer :pets
      t.integer :smoking
      t.integer :sleeping_hours
      t.integer :cooks
      t.integer :hours
      t.integer :lifestyle
      t.string :interests
      t.string :notes

      t.timestamps
    end
  end
end
