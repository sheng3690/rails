require 'test_helper'

class BlogInfoTest < ActiveSupport::TestCase
    fixtures :blog_info 

    setup do
        @blog = BlogInfo.find(1)
        @newblog = BlogInfo.new
    end

    test "test_blog_create" do
        @newblog.name = 'newblog'
        @newblog.email = '12345678@qq.com'
        assert @newblog.save
    end

    test "test_blog_read" do
        assert_instance_of BlogInfo, @blog 
        assert_equal 1, @blog.id, "test BlogInfo.id"
        assert_equal "blog1", @blog.name, "test BlogInfo.name"
        assert_equal "1234567@qq.com", @blog.email, "test BlogInfo.email"
    end

    test "test_blog_update" do
        @blog.name = 'updatename'
        assert @blog.save, @blog.errors.full_messages.join("; ")
        @blog.reload
        assert 'updatename', @blog.name
    end

    test "test_blog_delete" do
        @blog.destroy
        assert_raise(ActiveRecord::RecordNotFound) { BlogInfo.find(@blog.id) }
    end
end    
