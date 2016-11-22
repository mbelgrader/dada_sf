class Party < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 40 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :guests, numericality: {greater_than_or_equal_to: 8}
end
