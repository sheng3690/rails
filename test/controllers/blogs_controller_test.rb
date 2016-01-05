require 'test_helper'
require 'blogs_controller'
class BlogsControllerTest < ActionDispatch::IntegrationTest
    setup do
        @blog = BlogInfo.new
        @blog.name = 'testblog'
        @blog.blog_title = 'New Year around the world'
        @blog.email = 'testuser@gmail.com'
        @blog.description = 'How do people around the world celebrate their new year?'
        @blog.save

        @user = User.new
        @user.username = 'testuser'
        @user.email = 'testuser@gmail.com'
        @user.password = '1234567890'
        @user.password_confirmation = '1234567890'
        @user.admin = 1
        @user.save
    end
    def login(user)
        @user = user
        post login_confirm_users_path, user: {username: @user.username, password: @user.password}
        assert_redirected_to root_path
    end


    test "should get index" do
        get root_path
        assert_response :success
    end

    test "should set userinfo" do
        login(@user)
        post set_userinfo_blogs_path, :user => {:nick_name => 'honey'}
        assert_redirected_to set_blogs_path
    end

    test "should show ahout" do
        get about_blogs_path
        assert_response :success
    end

    test "should update blog" do
        post update_blog_blogs_path, :blog => {:name => 'testblog', :blog_title => 'New Year Around The World', :email => 'testuser@gmail.com', :description => 'How do people around the world celebrate their new year? Anything fun?'}
        assert_redirected_to set_blogs_path
    end

    test "should update password" do
        login(@user)
        post update_password_blogs_path, :user => {:old_password => '1234567890', :password => 'friends123', :password_confirmation => 'friends123'}
        assert_redirected_to login_path
    end

    test "should not update password" do
        login(@user)
        post update_password_blogs_path, :user => {:old_password => 'notvalid', :password => 'friends', :password_confirmation => 'friends'}
        assert_response :success
        assert_equal '原密码错误', flash.now[:error]
    end
end
