class AddFilmTitletoScenes < ActiveRecord::Migration
  def change
    add_column :scenes, :film_title, :string
  end
end
