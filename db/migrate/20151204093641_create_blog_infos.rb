class CreateBlogInfos < ActiveRecord::Migration
  def change
    create_table :blog_infos do |t|

      t.timestamps null: false
    end
  end
end
