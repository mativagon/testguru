# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  has_many :questions

  def self.tests_by_category(name)
    Test.joins('INNER JOIN categories ON tests.category_id = categories.id')
        .where(categories: { title: name })
        .pluck(:title)
  end
end
