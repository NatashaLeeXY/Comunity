class User < ApplicationRecord
  has_secure_password

  # Associations
  has_many :dependents, class_name: 'Dependent'
  has_many :favorites, class_name: 'Favorite', foreign_key: 'userID_id'
  has_many :organizations, through: :favorites, source: :organization
  has_many :reviews, class_name: 'Review'
  has_many :reviewed_organizations, class_name: 'Organization', through: :reviews
  has_many :surveys, class_name: 'Survey'

  # Validation for email and username
  validates :email, format: { with: Devise.email_regexp, message: "Please use a valid email" }
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :email, presence: true, uniqueness: { case_sensitive: false }

  private
  def downcase_email
    self.email = email.downcase
  end

  def downcase_username
    self.username = username.downcase
  end
end
