class CreateLanguages < ActiveRecord::Migration
  def self.up
    create_table :languages do |t|
      t.string :name
      t.string :symbol

      t.timestamps
    end
    Language.create_translation_table! :name => :string
  end

  def self.down
    Language.drop_translation_table!
    drop_table :languages
  end
end
