class Post < ApplicationRecord
  include ConstantValidatable

  # jitera-anchor-dont-touch: relations

  has_many :comments, dependent: :destroy

  has_many :likes, dependent: :destroy

  has_many :posttaggings, dependent: :destroy

  belongs_to :user

  # jitera-anchor-dont-touch: enum
  enum status: %w[init approve reject], _suffix: true

  # jitera-anchor-dont-touch: file

  # jitera-anchor-dont-touch: validation

  validates :title, length: { maximum: 255, message: I18n.t('errors.messages.too_long') }

  validates :content, length: { maximum: 255, message: I18n.t('errors.messages.too_long') }

  accepts_nested_attributes_for :comments

  accepts_nested_attributes_for :likes

  accepts_nested_attributes_for :posttaggings

  def self.associations
    %i[comments likes posttaggings]
  end

  # jitera-anchor-dont-touch: reset_password

  class << self
    def search_by_title(title)
      where("title LIKE ?", "%#{title}%")
    end
  end
end
