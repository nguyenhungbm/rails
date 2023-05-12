class Answer < ApplicationRecord
  belongs_to :question
  validates :name, presence: true, length: { maximum: 140 }
end
