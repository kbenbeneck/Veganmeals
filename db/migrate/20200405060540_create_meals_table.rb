class CreateMealsTable < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.string :name
      t.string :protein
      t.string :carb 
      t.string :fat
      t.string :fruit
      t.string :veg
    end
  end
end
