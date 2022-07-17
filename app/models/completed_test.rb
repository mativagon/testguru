# frozen_string_literal: true

class CompletedTest < ApplicationRecord
  belongs_to :user
  belongs_to :test
end
