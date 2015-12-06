class CreateArticleComments < ActiveRecord::Migration
  def change
    create_table :article_comments do |t|

      t.timestamps null: false
    end
  end
end
