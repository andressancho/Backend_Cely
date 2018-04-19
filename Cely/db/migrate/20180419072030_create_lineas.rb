class CreateLineas < ActiveRecord::Migration[5.1]
  def change
    create_table :lineas do |t|
      t.integer :id_noticia
      t.text :texto
      t.integer :posicion
      t.integer :autthentication_token
      t.integer :userId

      t.timestamps
    end
  end
end
