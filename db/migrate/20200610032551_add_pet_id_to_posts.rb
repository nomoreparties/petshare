class AddPetIdToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :pet_id, :integer
  end
end
