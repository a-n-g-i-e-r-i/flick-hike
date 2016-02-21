class ListScene < ActiveRecord::Base

  belongs_to :scene
  belongs_to :list

  validates_presence_of :scene, :list

end
