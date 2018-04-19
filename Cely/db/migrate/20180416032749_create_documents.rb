class CreateDocuments < ActiveRecord::Migration[5.1]
  def change
    create_table :documents do |t|
      t.integer :userId
      t.string :title
      t.timestamps
    end
  end
end
