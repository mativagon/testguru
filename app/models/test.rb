# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :tests_users
  has_many :tests, through: :tests_users
  has_many :questions
  has_many :completed_tests

  def self.tests_by_category(name)
    Test.joins('INNER JOIN categories ON tests.category_id = categories.id')
        .where(categories: { title: name })
        .order(:title).pluck(:title)
  end
end
