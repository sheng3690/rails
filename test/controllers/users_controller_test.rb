require 'test_helper'
require 'users_controller'

class UserControllerTest < ActionController::TestCase 
    setup do
        @controller = UsersController.new
        @user = User.new
        @user.username = 'user1'
        @user.email = '123456677@qq.com'
        @user.password = '1234567890'
        @user.password_confirmation = '1234567890'
        @user.admin = 1
        @user.save
    end

    test "register" do
        get :register 
        assert_response :success
        assert_template :register
        assert_template layout: "layouts/register"
    end

    test "register_confim_exist_user" do
        post :register_confirm, :user => {:username => 'user1', :email => '1234566@qq.com', :password => 'password123', :password_confirmation => 'password123'}

        assert_template :register
        assert_template layout: "layouts/register"
    end

    test "register_confim_no_valid" do
        post :register_confirm, :user => {:username => 'usertest', :email => '1234566@qq.com'}
        assert_response :success
        assert_template :register
        assert_template layout: "layouts/register"
    end

    test "register_confim_new_user" do
        post :register_confirm, :user => {:username => 'test1', :email => '234566@qq.com', :password => 'password123', :password_confirmation => 'password123'}
        assert_not_nil session[:user_id]
        assert_redirected_to root_path 
    end

    test "login" do
        get :login, :from => "test"
        assert_response :success
        assert_template :login
    end

    test "logout" do
        get :logout
        assert_nil session[:user_id]
    end

    test "login_confim" do
        post :login_confirm, :user => {:username => 'user1', :password => '1234567890'}
        assert_redirected_to root_path
    end

    test "login_confim_wrong" do
        post :login_confirm, :user => {:username => 'user1', :password => '123456000000'}
        assert_response :success
        assert_equal '用户名或密码错误', flash[:error]
    end
end
