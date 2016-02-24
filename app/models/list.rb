class List < ActiveRecord::Base

  belongs_to :user
  has_many :list_scenes, dependent: :destroy
  has_many :scenes, through: :list_scenes

  accepts_nested_attributes_for :list_scenes, :scenes

  validates :title, :description,
  presence: true,
  length: { maximum: 140 }

  VALID_TITLE_REGEX = //
    validates :title,
      length: { minimum: 2 },
      format: { with: VALID_TITLE_REGEX }

  VALID_DESCRIPTION_REGEX = //
    validates :description,
      length: { minimum: 10 },
      format: { with: VALID_DESCRIPTION_REGEX }

  default_scope {order("title ASC") }

  scope :title_like, -> (title) { where("title ilike ?", title)}
end
