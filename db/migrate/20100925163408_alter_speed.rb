class AlterSpeed < ActiveRecord::Migration
  def self.up
    change_column :kiosks, :speed, :integer, :default => 4000
  end

  def self.down
    change_column :kiosks, :speed, :integer, :default => 3
  end
end
