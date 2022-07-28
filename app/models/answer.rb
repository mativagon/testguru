# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question

  ANSWERS_LIMIT = 4

  validates :body, presence: true
  validate :validate_number_of_answers

  scope :correct, -> { where(correct: true) }

  private

  def validate_number_of_answers
    errors.add(:answers) if question.answers.count > ANSWERS_LIMIT
  end
end
