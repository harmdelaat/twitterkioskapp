class CreateKiosks < ActiveRecord::Migration
  def self.up
    create_table :kiosks do |t|
      t.string :name      
      t.string :background_file_name
      t.string :background_content_type
      t.string :background_file_size
      t.string :background_updated_at      
      t.timestamps
    end
  end

  def self.down
    drop_table :kiosks
  end
end
