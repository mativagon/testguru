# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: :User, foreign_key: :author_id
  has_many :tests_users
  has_many :users, through: :tests_users
  has_many :questions

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than: 0 }

  scope :easy, -> { where(level: 0..1).order(created_at: :desc) }
  scope :medium, -> { where(level: 2..4).order(created_at: :desc) }
  scope :hard, -> { where(level: 5..Float::INFINITY).order(created_at: :desc) }
  scope :category_name, -> (name) { joins(:category).where(category: { title: name }) }

  def self.tests_by_category(name)
    category_name(name).order(title: :desc).pluck(:title)
  end
end
