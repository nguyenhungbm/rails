class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers, allow_destroy: true

  enum question_type: { single_choice: 0, multiple_choice: 1, long_answer: 2 }
  validates :answers, presence: true
  validates :name, presence: true, length: { maximum: 140 }

  def self.question_type_select
    question_types.keys.map { |k| [k.titleize, k] }
  end
end
