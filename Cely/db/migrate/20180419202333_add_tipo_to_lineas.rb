class AddTipoToLineas < ActiveRecord::Migration[5.1]
  def change
    add_column :lineas, :tipo, :string
  end
end
