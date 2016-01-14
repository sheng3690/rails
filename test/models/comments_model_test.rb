require 'test_helper'

class ArticleCommentTest < ActiveSupport::TestCase
    fixtures :article_comments 

    setup do
        @comment = ArticleComment.find(1)
        @newcomment = ArticleComment.new
    end

    test "test_comment_create" do
        @newcomment.content = 'bbbbbbbbbbb'
        assert @newcomment.save
    end

    test "test_comment_read" do
        assert_instance_of ArticleComment, @comment 
        assert_equal 1, @comment.id, "test ArticleComment.id"
        assert_equal "aaaaaaaaaaaa", @comment.content, "test ArticleComment.title"
    end

    test "test_comment_update" do
        @comment.content = 'cccccccc'
        assert @comment.save, @comment.errors.full_messages.join("; ")
        @comment.reload
        assert 'cccccccc', @comment.content
    end

    test "test_comment_delete" do
        @comment.destroy
        assert_raise(ActiveRecord::RecordNotFound) { ArticleComment.find(@comment.id) }
    end
end    
