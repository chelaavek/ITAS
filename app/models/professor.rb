class Professor < ApplicationRecord
  has_one_attached :image
  has_many_attached :documents
  validates :name, presence: true
  validates :position, presence: true
  validates :cabinet, presence: true
  validates :phone_number, presence: true
  validates :email, presence: true
end
