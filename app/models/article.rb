class Article < ActiveRecord::Base
  attr_accessor :category_name
  belongs_to :category, counter_cache: 'articles_count'
  belongs_to :user
  has_many :article_stars
  has_many :article_views
  has_many :comments, class_name: 'ArticleComment'

  validates :title, length: {minimum: 10, maximum: 50}
  validates :tags, presence: true
  validates :source, allow_blank: true, format: {with: /[a-zA-Z0-9-]+\.[a-zA-Z0-9]+/}
  validates :content, length: {minimum: 10}

  validate :validate_category

end
