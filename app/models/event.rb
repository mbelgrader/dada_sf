class Event < ActiveRecord::Base
  has_attached_file :flyer, styles: { large: "600x600", medium: "300x300",
                                      thumb: "150x150#" }
  validates_attachment_content_type :flyer, content_type: /\Aimage\/.*\Z/
end
