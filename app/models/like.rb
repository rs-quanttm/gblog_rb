class Like < ApplicationRecord
  # jitera-anchor-dont-touch: relations

  belongs_to :user

  belongs_to :post

  # jitera-anchor-dont-touch: enum

  # jitera-anchor-dont-touch: file

  # jitera-anchor-dont-touch: validation

  # jitera-anchor-dont-touch: reset_password

  class << self
  end
end
