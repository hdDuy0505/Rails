class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books, id: :uuid do |t|
      t.text :comment  
      t.string :title

      t.timestamps
    end

    add_reference :books, :author, foreign_key: { to_table: :users }, type: :uuid
  end
end
