class question < ApplicationRecord
  has_many :questions, dependent: :destroy
  accepts_nested_attributes_for :questions, allow_destroy: true
  validates :name, presence: true, length: { maximum: 140 }
  validates :questions, presence: true
end
