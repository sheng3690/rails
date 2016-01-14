require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
    fixtures :articles

    setup do
        @article = Article.find(1)
        @newarticle = Article.new
    end

    test "test_article_create" do
        @newarticle.title = 'bbbbbbbbbbb'
        @newarticle.tags = 'bbbb'
        @newarticle.content = 'bbbbbbbbbbbbbbbb'
        @newarticle.category_id = 1
        assert @newarticle.save
    end

    test "test_article_read" do
        assert_instance_of Article, @article 
        assert_equal 1, @article.id, "test Article.id"
        assert_equal "aaaaaaaaaaaa", @article.title, "test Article.title"
        assert_equal "aaa", @article.tags, "test Article.tags"
        assert_equal "aaaaaaaaaaaaa", @article.content, "test Article.content"
    end

    test "test_article_update" do
        @article.category_id = 2
        assert @article.save, @article.errors.full_messages.join("; ")
        @article.reload
        assert 2, @article.category_id
    end

    test "test_article_delete" do
        @article.destroy
        assert_raise(ActiveRecord::RecordNotFound) { Article.find(@article.id) }
    end
end    
