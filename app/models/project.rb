 class Project < ActiveRecord::Base
  has_many :tmxfiles, :dependent => :destroy
  #has_many :languages, :through => :tmxfiles

  #http://api.rubyonrails.org/classes/ActionView/Helpers/FormHelper.html#method-i-fields_for 
  validates :name, :presence => true
  accepts_nested_attributes_for :tmxfiles, :allow_destroy => true

end
