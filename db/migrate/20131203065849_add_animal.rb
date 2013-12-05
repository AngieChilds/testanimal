class AddAnimal < ActiveRecord::Migration
  def change
    create_table :animals do |t|
      t.string :breed
      t.string :owner
      t.string :name 
      t.integer :food
      t.integer :hunger
      
      t.timestamps
    end
  end
end
