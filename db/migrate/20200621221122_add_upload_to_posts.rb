class AddUploadToPosts < ActiveRecord::Migration[6.0]
  def self.up
    add_attachment :posts, :upload
  end

  def self.down
    remove_attachment :posts, :upload
  end
end
