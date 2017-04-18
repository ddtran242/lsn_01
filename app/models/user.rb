class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :reports, dependent: :destroy
  has_many :reporting, through: :reports, source: :question
  has_many :votes, dependent: :destroy
  has_many :questions_voted, through: :votes, source: :votable,
    source_type: Question.name
  has_many :answers_voted, through: :votes, source: :votable,
    source_type: Answer.name
  mount_uploader :avatar, PictureUploader
  scope :hot_user, ->{(order vote_count: :DESC).limit 5}
  scope :order_most_voted, ->{order vote_count: :desc}

  def reporting? question
    reporting.include? question
  end
end
