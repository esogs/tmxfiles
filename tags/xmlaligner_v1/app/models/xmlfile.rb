class Xmlfile < ActiveRecord::Base
  validates_format_of :content_type, :with => /^text\/xml/, :message => "--- you can only upload xml files"

  def source_xmlfile=(xmlfile_field)
    self.source_name = base_part_of(xmlfile_field.original_filename)
    self.content_type = xmlfile_field.content_type.chomp
    self.source_data = xmlfile_field.read
  end

  def target_xmlfile=(xmlfile_field)
    self.target_name = base_part_of(xmlfile_field.original_filename)
    self.content_type = xmlfile_field.content_type.chomp
    self.target_data = xmlfile_field.read
  end
    
  def base_part_of(file_name)
    File.basename(file_name).gsub(/[^\w._-]/, '')
  end
end
