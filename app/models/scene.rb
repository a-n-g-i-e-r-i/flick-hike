class Scene < ActiveRecord::Base

  has_many :list_scenes, dependent: :destroy
  has_many :lists, through: :list_scenes

  accepts_nested_attributes_for :list_scenes, :lists

  # sort rows for render
  default_scope {order("title ASC") }

  scope :film_title_like, -> (film_title) { where("film_title ilike ?", film_title)}
end
