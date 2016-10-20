class Category < ApplicationRecord
  has_many :courses, dependent: :destroy
  validates :name, presence: true, length: {maximum: 50}
end
