class Scene < ActiveRecord::Base

  has_many :list_scenes, dependent: :destroy
  has_many :lists, through: :list_scenes

end
