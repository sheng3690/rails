# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151205174700) do

  create_table "article_comments", force: :cascade do |t|
    t.integer  "article_id"
    t.integer  "user_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "article_comments", ["article_id"], name: "index_article_comments_on_article_id"
  add_index "article_comments", ["user_id"], name: "index_article_comments_on_user_id"

  create_table "article_stars", force: :cascade do |t|
    t.integer  "article_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "article_stars", ["article_id", "user_id"], name: "index_article_stars_on_article_id_and_user_id"

  create_table "article_views", force: :cascade do |t|
    t.integer  "article_id"
    t.integer  "user_id"
    t.string   "ip"
    t.text     "param_string"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "article_views", ["article_id", "ip", "created_at"], name: "index_article_views_on_article_id_and_ip_and_created_at"

  create_table "articles", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.string   "tags"
    t.text     "content"
    t.integer  "view_count"
    t.integer  "star_count"
    t.integer  "comments_count"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "source"
    t.integer  "category_id"
  end

  add_index "articles", ["comments_count"], name: "index_articles_on_comments_count"
  add_index "articles", ["created_at"], name: "index_articles_on_created_at"
  add_index "articles", ["star_count"], name: "index_articles_on_star_count"
  add_index "articles", ["title"], name: "index_articles_on_title"
  add_index "articles", ["user_id"], name: "index_articles_on_user_id"
  add_index "articles", ["view_count"], name: "index_articles_on_view_count"

  create_table "blog_infos", force: :cascade do |t|
    t.string "name"
    t.string "blog_title"
    t.string "email"
    t.text   "description"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "articles_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["articles_count"], name: "index_categories_on_articles_count"

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.string   "email"
    t.boolean  "admin"
    t.datetime "last_login_time"
    t.datetime "last_reply_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nick_name"
    t.string   "avatar"
  end

  add_index "users", ["email"], name: "index_users_on_email"
  add_index "users", ["nick_name"], name: "index_users_on_nick_name"
  add_index "users", ["username"], name: "index_users_on_username"

end
