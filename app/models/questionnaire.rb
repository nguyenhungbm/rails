class Questionnaire < ApplicationRecord
  validates :name, presence: true, length: { maximum: 140 }
  validates :body, presence: true, length: { maximum: 140 }
end
