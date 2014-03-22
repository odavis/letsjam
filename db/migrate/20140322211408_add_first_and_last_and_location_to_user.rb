class AddFirstAndLastAndLocationToUser < ActiveRecord::Migration
  def change
    add_column :users, :first, :string
    add_column :users, :last, :string
    add_column :users, :location, :text
    add_column :users, :age, :integer
  end
end
