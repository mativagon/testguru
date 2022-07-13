class AddReferences < ActiveRecord::Migration[6.1]
  def change
    add_reference(:tests, :category, foreign_key: true, null: false)
    add_reference(:questions, :test, foreign_key: true, null: false)
    add_reference(:answers, :question, foreign_key: true, null: false)
  end
end
