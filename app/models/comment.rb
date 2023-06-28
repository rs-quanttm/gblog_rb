class Comment < ApplicationRecord
  include ConstantValidatable

  # jitera-anchor-dont-touch: relations

  belongs_to :user

  belongs_to :post

  # jitera-anchor-dont-touch: enum

  # jitera-anchor-dont-touch: file

  # jitera-anchor-dont-touch: validation

  validates :content, length: { maximum: 255, message: I18n.t('errors.messages.too_long') }

  # jitera-anchor-dont-touch: reset_password

  class << self
  end
end
