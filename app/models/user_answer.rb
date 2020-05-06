class UserAnswer < ApplicationRecord
  belongs_to :question
  belongs_to :poll_answer
end
