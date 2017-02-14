class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  validates :description, :presence => true
end
