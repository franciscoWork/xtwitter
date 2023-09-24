# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_09_24_043432) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookmarks", force: :cascade do |t|
    t.bigint "tweet_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tweet_id"], name: "index_bookmarks_on_tweet_id"
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

  create_table "followers", force: :cascade do |t|
    t.bigint "follower_id"
    t.bigint "followee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["followee_id"], name: "index_followers_on_followee_id"
    t.index ["follower_id"], name: "index_followers_on_follower_id"
  end

  create_table "hastags", force: :cascade do |t|
    t.text "name"
    t.text "tweet"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "tweet_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tweet_id"], name: "index_likes_on_tweet_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "taggins", force: :cascade do |t|
    t.bigint "tweet_id", null: false
    t.bigint "hastag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hastag_id"], name: "index_taggins_on_hastag_id"
    t.index ["tweet_id"], name: "index_taggins_on_tweet_id"
  end

  create_table "tweetreplies", force: :cascade do |t|
    t.bigint "tweet_id", null: false
    t.bigint "user_id", null: false
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tweet_id"], name: "index_tweetreplies_on_tweet_id"
    t.index ["user_id"], name: "index_tweetreplies_on_user_id"
  end

  create_table "tweets", force: :cascade do |t|
    t.text "body"
    t.bigint "user_id", null: false
    t.boolean "retweet"
    t.integer "quote_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_tweets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "name"
    t.string "lastname"
    t.string "email"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "bookmarks", "tweets"
  add_foreign_key "bookmarks", "users"
  add_foreign_key "followers", "users", column: "followee_id"
  add_foreign_key "followers", "users", column: "follower_id"
  add_foreign_key "likes", "tweets"
  add_foreign_key "likes", "users"
  add_foreign_key "taggins", "hastags"
  add_foreign_key "taggins", "tweets"
  add_foreign_key "tweetreplies", "tweets"
  add_foreign_key "tweetreplies", "users"
  add_foreign_key "tweets", "tweets", column: "quote_id"
  add_foreign_key "tweets", "users"
end
