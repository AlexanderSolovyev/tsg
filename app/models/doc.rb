class Doc < ApplicationRecord
  has_attached_file :document,
    :storage => :dropbox,
    :dropbox_credentials => Rails.root.join('config/dropbox.yml')

  validates_attachment_content_type :document, content_type: [/pdf\Z/]
end
