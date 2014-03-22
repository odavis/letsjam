class AddProfileIdToBands < ActiveRecord::Migration
  def change
    add_column :bands, :profile_id, :integer
  end
end
