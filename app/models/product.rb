class Product < ApplicationRecord
  belongs_to :category

  mount_uploader :image, ImageUploader
  mount_uploader :image_second, ImageUploader

  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
end
