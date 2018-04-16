class AddUserIdToDocuments < ActiveRecord::Migration[5.1]
  def change
    add_column :documents, :usr_id, :integer
  end
end
