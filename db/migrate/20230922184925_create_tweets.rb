class CreateTweets < ActiveRecord::Migration[7.0]
  def change
    create_table :tweets do |t|
      t.text :body
      t.references :user, null: false, foreign_key: true
      t.boolean :retweet
      t.integer :quote_id

      t.timestamps
    end
  end
end
