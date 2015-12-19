class User < ActiveRecord::Base
  has_secure_password

  has_many :articles
  has_many :comments, class_name: 'ArticleComment'

  before_save :set_admin
  validates :username, length: {minimum: 5, maximum: 20}, uniqueness: true
  validates :email, format: {with: /\A[a-zA-Z0-9\-]+@[a-zA-Z0-9-]+\.(org|com|cn|io|net|cc|me)\z/}, uniqueness: true
  validates :password, length: {minimum: 6}, confirmation: true, if: :need_valid_password?
  validates :nick_name, length: {minimum: 2, maximum: 20}, uniqueness: true, if: 'nick_name.present?'

end
