class Question < ActiveRecord::Base
  has_many :answers
  belongs_to :user
  validates :description, :presence => true
end
