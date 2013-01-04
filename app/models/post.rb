class Post < ActiveRecord::Base
  attr_accessible :body, :publish_date, :title, :user_id
  validates :title, presence: true
  validates :body, presence: true
  validates :publish_date, presence: true
  validates :user_id, presence: true
  belongs_to :user
  has_and_belongs_to_many :categories
end
