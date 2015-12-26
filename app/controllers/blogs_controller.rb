#encoding: utf-8
class BlogsController < ApplicationController
  before_filter :require_login, only: [:set, :set_userinfo, :upload_img, :set_blog, :update_blog, :change_password, :update_password]
  def index
    @articles = Article.order('updated_at desc').limit(10)
    @new_comments = ArticleComment.order('updated_at desc').limit(10)
  end

  def set

  end

  def set_userinfo
    user = User.find @current_user.id
    user.nick_name = params[:user][:nick_name] if params[:user][:nick_name].present?
    begin
      if params[:user][:avatar].present?
        upload_info = upload_picture params[:user][:avatar]
        user.avatar = "/images/#{upload_info[:real_file_name]}"
      end
    rescue UploadException => e
      flash.now[:error] = e.message
      render 'set'
    else
      if user.save
        redirect_to set_blogs_path
      else
        flash.now[:error] = user.errors.full_messages.first
        render 'set'
      end
    end
  end

  def set_blog
    @blog = BlogInfo.first
    @blog = BlogInfo.new unless @blog
  end

  def update_blog
    
  end

  def about
    @blog = BlogInfo.first
  end

  def change_password

  end

  def update_password
    
  end

  def upload_img
    
  end

  def preview
    result = {status: false, message: ''}
    if params[:content]
      result[:status] = true
      result[:message] = markdown_parser params[:content]
    end
    render json: result.to_json
  end

  protected

  def upload_picture(file)
    
  end
end
