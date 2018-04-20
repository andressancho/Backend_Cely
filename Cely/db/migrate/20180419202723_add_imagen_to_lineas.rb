
class AddImagenToLineas < ActiveRecord::Migration[5.1]
  def change
    add_column :lineas, :imagen, :string
  end
end
