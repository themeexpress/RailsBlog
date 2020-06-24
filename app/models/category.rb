class Category < ApplicationRecord
  has_many :article_categories
  has_many :articles, through: :article_categories
  validates :name, presence: true, length: {minimum:3, maximum:50}
  #validate_uniqueness_of :name
  validates :name, uniqueness: true
end