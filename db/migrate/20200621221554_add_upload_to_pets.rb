class AddUploadToPets < ActiveRecord::Migration[6.0]
  def self.up
    add_attachment :pets, :upload
  end

  def self.down
    remove_attachment :pets, :upload
  end
end
