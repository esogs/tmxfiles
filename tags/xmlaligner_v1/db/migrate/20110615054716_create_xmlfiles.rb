class CreateXmlfiles < ActiveRecord::Migration
  def self.up
    create_table :xmlfiles do |t|
      t.string :comment
      t.string :source_name
      t.string :target_name
      t.string :content_type
      t.string :source_language
      t.string :target_language
      t.binary :source_data, :limit => 1.megabyte
      t.binary :target_data, :limit => 1.megabyte
    end
  end

  def self.down
    drop_table :xmlfiles
  end
end
