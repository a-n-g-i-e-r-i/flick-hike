class User < ActiveRecord::Base
  has_many :lists, dependent: :destroy

  has_secure_password

  # Sets user's userName & email address to lowercase during account creation.
  before_save { self.email = email.downcase }
  before_save { self.username = username.downcase }

  validates :username, :email, :password, :description,
  presence: true,
  length: { maximum: 140 }

  VALID_EMAIL_REGEX = /\A[\w+\-.\+]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false }

  validates :username,
    uniqueness: { case_sensitive: false }

  VALID_PASSWORD_REGEX = /[a-zA-Z0-9]+/
    validates :password,
      length: { minimum: 8 },
      format: { with: VALID_PASSWORD_REGEX }

  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user.try(:authenticate, params[:password])
  end

end
