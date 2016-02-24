class Scene < ActiveRecord::Base

  has_many :list_scenes, dependent: :destroy
  has_many :lists, through: :list_scenes

  accepts_nested_attributes_for :list_scenes, :lists

  # sort rows for render
  default_scope {order("title ASC") }

  # search function for index method
  def self.search(search)
    #########################3
    where("film_title ILIKE ?", "%#{search}%")
  end
end
