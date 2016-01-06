require 'test_helper'
require 'articles_controller'

class ArticlesControllerTest < ActionController::TestCase
  setup do
    @controller = AriticlesController.new
    @ariticle = Ariticle.new
    @ariticle.title = 'title1'
    @ariticle.tags = 'tags1'
    @ariticle.source = 'source1'
    @ariticle.content = 'content1'
    @ariticle.save
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:articles)
  end

  test "should show article" do
    get :show, id: @ariticle.id
    assert_response :success
  end

  test "should create ariticle" do
    post :create,:ariticle =>{:title=>'title1', :tags=>'tags1', :source=>'source', :content=>'content1'}
    assert_not_nil session[:ariticle_id]
    assert_redirected_to article_path(@ariticle)
  end

  test "should destroy article" do
    assert_difference('Article.count', -1) do
      delete :destroy, id: @article.id
    end
 
    assert_redirected_to articles_path
  end

  test "destroy_wrong" do
    post :destroy, :ariticle=>{:username=>'title1'}
    assert_response :success
    assert_equal '删除失败', flash[:error]
  end

end
