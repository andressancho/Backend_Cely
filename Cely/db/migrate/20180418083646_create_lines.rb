class CreateLines < ActiveRecord::Migration[5.1]
  def change
    create_table :lines do |t|

      t.integer :document_id
      t.string :text
      t.integer :position      
    end
  end
end
