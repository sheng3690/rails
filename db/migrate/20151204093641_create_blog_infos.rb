class CreateBlogInfos < ActiveRecord::Migration
  def change
    create_table :blog_infos do |t|
      t.string :name
      t.string :blog_title
      t.string :email
      t.text :description
    end
  end
end
