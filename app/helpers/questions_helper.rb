module QuestionsHelper
  def question_header(question)
    header = "#{question.test.title} вопрос"
    question.new_record? ? "Создать новый #{header}" : "Изменить #{header}"
  end
end
