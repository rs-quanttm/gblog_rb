class Posttagging < ApplicationRecord
  # jitera-anchor-dont-touch: relations

  belongs_to :post

  belongs_to :tag

  # jitera-anchor-dont-touch: enum

  # jitera-anchor-dont-touch: file

  # jitera-anchor-dont-touch: validation

  # jitera-anchor-dont-touch: reset_password

  class << self
  end
end
