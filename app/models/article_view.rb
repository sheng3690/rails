class ArticleView < ActiveRecord::Base
    belongs_to :article, counter_cache: 'view_count'
end
