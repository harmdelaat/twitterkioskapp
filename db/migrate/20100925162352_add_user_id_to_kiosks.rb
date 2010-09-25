class AddUserIdToKiosks < ActiveRecord::Migration
  def self.up
    add_column :kiosks, :user_id, :integer
  end

  def self.down
    remove_coloumn :kiosks, :user_id
  end
end
