class AddOver3200ToUsers < ActiveRecord::Migration
  def change
    add_column :users, :over3200, :boolean
  end
end
