class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :author
      t.string :author_tip
      t.string :budget
      t.string :difficulty
      t.integer :people_quantity
      t.string :cook_time
      t.string :prep_time
      t.string :total_time
      t.string :image_url

      t.timestamps
    end
  end
end
