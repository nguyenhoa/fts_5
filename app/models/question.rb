class Question < ActiveRecord::Base
  has_many :answer_sheets
  has_many :examinations, through: :answer_sheets
  has_many :options, dependent: :destroy
  belongs_to :subject
  accepts_nested_attributes_for :options

  scope :generate_random_question, ->(subject_id, total_question) do
    where(subject_id: subject_id).order("rand()").limit(total_question)
  end 
end
