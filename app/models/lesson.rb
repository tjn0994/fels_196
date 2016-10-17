class Lesson < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :exam, dependent: :destroy
  has_many :user_lessons, dependent: :destroy
  has_many :words, dependent: :destroy
end
