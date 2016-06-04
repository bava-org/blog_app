class Post < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :body
  acts_as_votable
  has_many :comments, dependent: :destroy
  belongs_to :user
end
