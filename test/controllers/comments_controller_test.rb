require 'test_helper'
require 'articles_controller'
require 'comments_controller'

class CommentsControllerTest < ActionController::TestCase
  fixtures :articles
  setup do
	@controller = CommentsController.new
	@comment = ArticleComment.new
	@comment.content = 'comment111111'
#	@comment.status = true
#	@comment.message = 'message1'
	@comment.save
  end

  test "should create comment" do
	post :create, articles:"aaaaaaaaaaaa", article_id: 1, :article_comment => {:content => 'content222222'}
	#assert_not_nil session[:comment_id]
#	assert_redirected_to comment_path(@comment)
    #assert_respond_to "format.js"
  end

  test "should edit comment" do
	#get:edit,id:@comment.id
	#assert_response:success
  end

  test "should update comment" do
	#get:update,id:@comment.id
	#assert_response:success
  end

  test "should destroy comment" do
	#assert_difference('Comment.count',-1) do
	#	delete:destroy,id:@comment.id
	#end

	#assert_redirected_to comments_path
  end

  test "destroy_wrong" do
	#post:destroy,:comment=>{:content=>'content1'}
	#assert_response:success
	#assert_equal '删除失败',flash[:error]
  end
end

