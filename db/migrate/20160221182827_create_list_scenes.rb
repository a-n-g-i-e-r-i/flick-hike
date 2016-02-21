class CreateListScenes < ActiveRecord::Migration
  def change
    create_table :list_scenes do |t|
      t.references :scene, index: true, foreign_key: true
      t.references :list, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
