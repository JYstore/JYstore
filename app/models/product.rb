class Product < ApplicationRecord
  belongs_to :category

  mount_uploader :image, ImageUploader
  mount_uploader :image_second, ImageUploader
  mount_uploader :image_third, ImageUploader
  mount_uploader :image_fourth, ImageUploader
  mount_uploader :image_fifth, ImageUploader

  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
end
