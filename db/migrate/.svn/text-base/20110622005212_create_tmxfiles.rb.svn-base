class CreateTmxfiles < ActiveRecord::Migration
  def self.up
    create_table :tmxfiles do |t|
      t.integer :project_id
      t.integer :language_id
      t.string :name
      t.string :content_type
      t.binary :data
      t.boolean :source

      t.timestamps
    end
  end

  def self.down
    drop_table :tmxfiles
  end
end
