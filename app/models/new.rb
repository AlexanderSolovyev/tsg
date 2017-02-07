class New < ApplicationRecord
  validates :title, :description,  presence: true
end
