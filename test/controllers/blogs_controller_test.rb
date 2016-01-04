require 'test_helper'
require 'blogs_controller'
class BlogsControllerTest < ActionController::TestCase
    setup do
        @controller = BlogsController.new
        @blog = BlogInfo.new
        @blog.name = 'testblog'
        @blog.blog_title = 'New Year around the world'
        @blog.email = 'testuser@gmail.com'
        @blog.description = 'How do people around the world celebrate their new year?'
        @blog.save

        @user = User.new
        @user.username = 'testuser'
        @user.email = 'testuser@gmail.com'
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.admin = 1
        @user.save
    end

    test "should get index" do
        get :index
        assert_response :success
    end

    test "should set userinfo" do
        patch :set_userinfo, username: @user.username, :user => {:nick_name => 'honey', :avatar => '/users/megan/downloads/1.jpg'}
        assert_not_nil assigns(:user)
        assert_redirected_to set_blogs_path
    end

    test "should update blog" do
        post :update_blog, :blog => {:name => 'test', :blog_title => 'test', :email => 'testuser@gmail.com', :description => 'This is a test.'}
        assert_redirected_to set_blogs_path
    end

    test "should update password" do
        patch :update_password, username: @user.username, :user=>{:old_password => @user.password, :password => 'friends', :password_confirmation => 'friends'}
        assert_response :success
        assert_redirected_to login_path(assigns(:user))
    end

    test "should not update password" do
        post :update_password, {:old_password => 'notvalid', :password => 'friends', :password_confirmation => 'friends'}
        assert_response :error
    end

end
