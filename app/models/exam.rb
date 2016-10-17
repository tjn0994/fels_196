class Exam < ApplicationRecord
  belongs_to :lesson
  belongs_to :user
  has_many :learned_words, dependent: :destroy
  has_one :result
end
