class CreatePotentials < ActiveRecord::Migration
  def change
    create_table :potentials do |t|
      t.references :favorable, :polymorphic => true
      t.references :user
      t.timestamps
    end
  end

  	def self.down
  	   drop_table :potentials
  	 end
end
