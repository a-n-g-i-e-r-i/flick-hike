class ListScene < ActiveRecord::Base

  belongs_to :scene
  belongs_to :list
  
  # be wary of these simultaneous validations on join tables
  # validates_presence_of :scene, :list

end
