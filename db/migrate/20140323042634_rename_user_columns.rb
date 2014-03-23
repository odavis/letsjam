class RenameUserColumns < ActiveRecord::Migration
  def change

    rename_column :users, :first, :firstName
    rename_column :users, :last, :lastName
    rename_column :users, :age, :birthdate
    change_column :users, :birthdate, :datetime

  end

end
