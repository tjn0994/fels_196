class Lesson < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :exam, dependent: :destroy
  has_many :user_lessons, dependent: :destroy
  has_many :words, dependent: :destroy
  belongs_to :course

  scope :order_date_desc, ->{order created_at: :desc}

  mount_uploader :image, ImageUploader
  validates :name, presence: true, length: {maximum: 50}
  validate  :image_size

  private
    def image_size
      if image.size > Settings.image_size.megabytes
        errors.add :image, t("error_image")
      end
    end
end
