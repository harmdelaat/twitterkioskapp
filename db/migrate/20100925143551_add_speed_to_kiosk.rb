class AddSpeedToKiosk < ActiveRecord::Migration
  def self.up
    add_column :kiosks, :speed, :integer, :default => 3
  end

  def self.down
    remove_column :kiosks, :speed
  end
end
