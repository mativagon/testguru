# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  has_many :author_tests, class_name: :Test, inverse_of: :author, foreign_key: :author_id
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :gists, dependent: nil
  has_many :badges_user, dependent: :destroy
  has_many :badges, through: :badges_user

  validates :first_name, :last_name, presence: true

  def tests_by_level(level)
    tests.where(level:)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    is_a?(Admin)
  end
end
