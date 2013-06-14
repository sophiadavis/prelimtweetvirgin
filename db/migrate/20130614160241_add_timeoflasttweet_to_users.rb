class AddTimeoflasttweetToUsers < ActiveRecord::Migration
  def change
    add_column :users, :timeoflasttweet, :datetime
  end
end
