class Course < ApplicationRecord
  belongs_to :category
  has_many :lessons, dependent: :destroy
end
