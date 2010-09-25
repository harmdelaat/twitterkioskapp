class CreateFxes < ActiveRecord::Migration
  def self.up
    create_table :fxes do |t|
      t.string :name
      t.belongs_to :kiosk
      t.timestamps
    end
  end

  def self.down
    drop_table :fxes
  end
end
