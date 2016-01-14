require 'test_helper'

class UserTest < ActiveSupport::TestCase
    fixtures :users
    setup do
        @user = User.find(1)
        @newuser = User.new
    end

    test "test_user_create" do
        @newuser.username = 'newuser'
        @newuser.email = '1234568@qq.com'
        @newuser.password = '1234567890'
        @newuser.password_confirmation = '1234567890'
        @newuser.admin = 1
        assert @newuser.save

    end

    test "test_user_read" do
        assert_instance_of User, @user
        assert_equal 1, @user.id, "test User.id"
        assert_equal true, @user.admin, "test User.admin"
        assert_equal "user1", @user.username, "test User.username"
        assert_equal "1234567@qq.com", @user.email, "test User.email"
    end

    test "test_user_update" do
        @user.email = 'newemail@gmail.com'
        assert @user.save, @user.errors.full_messages.join("; ")
        @user.reload
        assert "newemail@gmail.com", @user.email
    end

    test "test_user_delete" do
        @user.destroy
        assert_raise(ActiveRecord::RecordNotFound) { User.find(@user.id)  }
    end
end

