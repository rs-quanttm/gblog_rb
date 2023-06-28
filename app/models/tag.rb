class Tag < ApplicationRecord
  include ConstantValidatable

  # jitera-anchor-dont-touch: relations

  has_many :posttaggings, dependent: :destroy

  # jitera-anchor-dont-touch: enum

  # jitera-anchor-dont-touch: file

  # jitera-anchor-dont-touch: validation

  validates :content, presence: true, length: { maximum: 255, message: I18n.t('errors.messages.too_long') }

  accepts_nested_attributes_for :posttaggings

  def self.associations
    [:posttaggings]
  end

  # jitera-anchor-dont-touch: reset_password

  class << self
  end
end
