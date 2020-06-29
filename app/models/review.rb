class Review < ApplicationRecord
  belongs_to :admin_user
  validates :title, presence: true
  validates :rating, presence: true,
            numericality: {:less_than_or_equal_to => 5, :greater_than => 0}
end
