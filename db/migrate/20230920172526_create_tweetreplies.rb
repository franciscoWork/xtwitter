class CreateTweetreplies < ActiveRecord::Migration[7.0]
  def change
    create_table :tweetreplies do |t|
      t.text :comment
      t.references :tweet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
