class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments, id: :uuid, default: -> { "gen_random_uuid()" }  do |t|
      t.text :comment, null: false

      t.timestamps
    end

    add_reference :comments, :book, foreign_key: { to_table: :books }, type: :uuid, null: false
    add_reference :comments, :owner, foreign_key: { to_table: :users }, type: :uuid, null: false
  end
end
