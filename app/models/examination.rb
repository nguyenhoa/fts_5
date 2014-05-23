class Examination < ActiveRecord::Base
  has_many :answer_sheets
  has_many :questions, through: :answer_sheets
  belongs_to :user
  belongs_to :subject
  accepts_nested_attributes_for :answer_sheets
  default_scope -> { order('created_at DESC') }
end
