class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.integer :user_id
      t.string :num_followers
      t.string :num_friends
      t.string :num_tweets
      t.datetime :created_at
      t.string :first_tweet
      t.string :latest_tweet
      t.string :profile_link

      t.timestamps
    end
  end
end
