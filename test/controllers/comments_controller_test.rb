//comments_controller_test.rb
require 'test_helper'
require 'articles_controller'
require 'comments_controller'

class CommentsControllerTest < ActionController::TestCase
  setup do
	@controller = CommentsController.new
	@comment = Comment.new
	@comment .content = 'comment1'
	@comment.status = true
	@comment.message = 'message1'
	@comment.save
  end

  test “should create comment” do
	post:create,:comment=>{:content=>'content1',:status=>true,:message=>'message1'}
	assert_not_nil session[:comment_id]
	assert_redirected_to comment_path(@comment)
  end

  test “should edit comment” do
	get:edit,id:@comment.id
	assert_response:success
  end

  test “should update comment” do
	get:update,id:@comment.id
	assert_response:success
  end

  test “should destroy comment” do
	assert_difference('Comment.count',-1) do
		delete:destroy,id:@comment.id
	end

	assert_redirected_to comments_path
  end

  test “destroy_wrong” do
	post:destroy,:comment=>{:content=>'content1'}
	assert_response:success
	assert_equal '删除失败',flash[:error]
  end
end

