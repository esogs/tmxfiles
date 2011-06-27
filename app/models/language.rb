class Language < ActiveRecord::Base
  has_many :tmxfiles
  #has_many :projects, :through => :tmxfiles

  before_destroy :ensure_not_referenced_by_any_tmxfiles

  private

  def ensure_not_referenced_by_any_tmxfiles
    if tmxfiles.empty?
      return true
    else
      errors.add(:base, 'There are tmxfiles that reference this language')
      return false
    end
  end

end
