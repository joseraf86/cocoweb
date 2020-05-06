class Question < ApplicationRecord
  belongs_to :poll
  has_many :poll_answers
  has_one :open_answer

  enum question_type: [:option, :radio, :checkbox]
end
