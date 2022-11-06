class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_update :set_next_question

  MIN_SUCCESS_PERCENTAGE = 85

  def completed?
    current_question.nil?
  end

  def success_percentage
    ((correct_questions.to_f / test.questions.count) * 100).round
  end

  def current_progress
    passed_questions_count = test.questions.order(:id).index(current_question)
    (passed_questions_count.to_f / test.questions.count * 100).round
  end

  def successfull?
    success_percentage >= MIN_SUCCESS_PERCENTAGE
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    save!
  end

  def question_number
    self.test.questions.order(:id).index(current_question) + 1
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count

    (correct_answers_count == correct_answers.where(id: answer_ids).count) &&
      correct_answers_count == answer_ids.count
  end

  def correct_answers
    current_question.answers.correct
  end

  def set_next_question
    self.current_question = test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
