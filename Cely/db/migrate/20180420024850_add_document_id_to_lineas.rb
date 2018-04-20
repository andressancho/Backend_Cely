class AddDocumentIdToLineas < ActiveRecord::Migration[5.1]
  def change
    add_column :lineas, :document_id, :integer
  end
end
