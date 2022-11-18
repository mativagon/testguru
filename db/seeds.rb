# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

frontend = Category.create(title: 'Frontend')
backend = Category.create(title: 'Backend')
machine_learning = Category.create(title: 'Machine Learning')

lebovski = User.create(first_name: 'Lebovski', last_name: 'Lebovski', email: 'lebovski@gmail.com', password: 'qwerty')
lupa = User.create(first_name: 'Lupa', last_name: 'Lupa', email: 'lupa@gmail.com', password: 'password')
marchenko = User.create(first_name: 'Marchenko', last_name: 'Marchenko', email: 'marchenko@gmail.com', password: '0123456789', type: 'Admin')
marchenko.confirm

html = Test.create(title: 'HTML', level: 1, category_id: frontend.id, author_id: marchenko.id)
ruby = Test.create(title: 'Ruby', level: 2, category_id: backend.id, author_id: marchenko.id)
javascript = Test.create(title: 'JavaScript', level: 3, category_id: machine_learning.id, author_id: marchenko.id)

question_1 = Question.create(body: 'Какой тег позволяет вставлять картинки в HTML документы?', test_id: html.id)
question_2 = Question.create(body: 'Что делает метод .capitalize?', test_id: ruby.id)
question_3 = Question.create(body: 'Чем отличается метод setInterval() от setTimeout()?', test_id: javascript.id)

answer_1 = Answer.create(body: '<img>', correct: true, question_id: question_1.id)
answer_2 = Answer.create(body: '<pic>', question_id: question_1.id)
answer_3 = Answer.create(body: 'Первый символ строки преобразуется в верхний регистр, а остальные — в нижний.',
                         correct: true, question_id: question_2.id)
answer_4 = Answer.create(body: 'Первый символ строки преобразуется в нижний регистр, а остальные — в верхний.',
                         question_id: question_2.id)
answer_5 = Answer.create(body: 'Функция запускается не один раз, а периодически через указанный интервал времени.',
                         correct: true, question_id: question_3.id)
answer_6 = Answer.create(body: 'Функция запускается один раз.', question_id: question_3.id)
