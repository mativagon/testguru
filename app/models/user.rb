# frozen_string_literal: true

class User < ApplicationRecord
  has_many :author_tests, class_name: :Test, inverse_of: :author, foreign_key: :author_id
  has_many :test_passages
  has_many :tests, through: :test_passages

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true

  has_secure_password

  def tests_by_level(level)
    tests.where(level:)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
