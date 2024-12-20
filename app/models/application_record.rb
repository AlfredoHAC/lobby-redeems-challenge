class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  before_save :fill_id

  def fill_id
    self.id = SecureRandom.uuid if id.blank?
  end
end
