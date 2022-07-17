class User < ApplicationRecord
  has_many :completed_test

  def tests_by_level(level)
    Test.where(level: level)
        .joins('INNER JOIN completed_tests ON tests.id = completed_tests.test_id')
        .where(completed_test: { user_id: id })
  end
end
