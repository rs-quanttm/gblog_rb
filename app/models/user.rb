class User < ApplicationRecord
  include ConstantValidatable
  devise :database_authenticatable, :registerable, :rememberable, :validatable,
         :trackable, :recoverable, :lockable
  # jitera-anchor-dont-touch: relations

  has_many :posts, dependent: :destroy

  has_many :likes, dependent: :destroy

  has_many :comments, dependent: :destroy

  # jitera-anchor-dont-touch: enum
  enum roles: %w[Admin User Author], _suffix: true

  # jitera-anchor-dont-touch: file

  # jitera-anchor-dont-touch: validation

  PASSWORD_FORMAT = /\A^(?=.*[a-zA-Z])(?=.*[0-9]).{8,}$\z/
  validates :password, format: PASSWORD_FORMAT, if: -> { password.present? }

  validates :email, length: { maximum: 255, message: I18n.t('errors.messages.too_long') }

  validates :email, presence: { message: I18n.t('errors.messages.blank') }

  validates :email, uniqueness: { message: I18n.t('errors.messages.taken') }

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: I18n.t('errors.messages.invalid') }

  accepts_nested_attributes_for :posts

  accepts_nested_attributes_for :comments

  accepts_nested_attributes_for :likes

  def self.associations
    %i[posts comments likes]
  end

  # jitera-anchor-dont-touch: reset_password
  def generate_reset_password_token
    raw, enc = Devise.token_generator.generate(self.class, :reset_password_token)
    self.reset_password_token   = enc
    self.reset_password_sent_at = Time.now.utc
    save(validate: false)
    raw
  end

  class << self
    def authenticate?(email, password)
      user = User.find_for_authentication(email: email)
      return false if user.blank?

      if user&.valid_for_authentication? { user.valid_password?(password) }
        user.reset_failed_attempts!
        return user
      end

      # We will show the error message in TokensController
      return user if user&.access_locked?

      false
    end
  end
end
