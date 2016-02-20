class CreateScenes < ActiveRecord::Migration
  def change
    create_table :scenes do |t|
      t.string :locations
      t.string :title
      t.string :writer
      t.string :director
      t.string :release_year
      t.string :production_company
      t.string :actor_1
      t.string :actor_2
      t.string :actor_3

      t.timestamps null: false
    end
  end
end
