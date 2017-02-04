class AddDocumentColumnToDoc < ActiveRecord::Migration[5.0]
  def change
    add_attachment :docs, :document
  end
end
