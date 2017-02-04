class Doc < ApplicationRecord
  has_attached_file :document
  validates_attachment_content_type :document, content_type: [/pdf\Z/]
end
