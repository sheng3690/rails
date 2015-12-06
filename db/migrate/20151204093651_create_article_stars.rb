class CreateArticleStars < ActiveRecord::Migration
  def change
    create_table :article_stars do |t|

      t.timestamps null: false
    end
  end
end
