class AddLikeToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :like, :integer, default: 0
  end
end