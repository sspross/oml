class CreateMovies < ActiveRecord::Migration
  def self.up
    create_table :movies do |t|
      t.timestamps
    end
    Movie.create_translation_table! :title => :string, :description => :text
  end

  def self.down
    Movie.drop_translation_table!
    drop_table :movies
  end
end
