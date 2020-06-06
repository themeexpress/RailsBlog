class Category < ApplicationRecord
  validates :name, presence: true, length: {minimum:3, maximum:50}
  #validate_uniqueness_of :name
  validates :name, uniqueness: true
end