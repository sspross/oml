class CreateRoles < ActiveRecord::Migration
  def self.up
    create_table :roles do |t|
      t.string :name
      t.text :description
      t.boolean :deleted

      t.timestamps
    end
    Role.create_translation_table! :name => :string, :description => :text
  end

  def self.down
    Role.drop_translation_table!
    drop_table :roles
  end
end
