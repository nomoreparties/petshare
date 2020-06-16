class AddFollowsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :follows, :text, array: true, default: []
  end
end
