class CreateImages < ActiveRecord::Migration
  def self.up
    create_table :images do |t|
      t.text :description
      t.integer :parent_id
      t.string :content_type
      t.string :filename
      t.string :thumbnail
      t.integer :size
      t.integer :width
      t.integer :height

      t.timestamps
    end
    Image.create_translation_table! :description => :text
  end

  def self.down
    Image.drop_translation_table!
    drop_table :images
  end
end
