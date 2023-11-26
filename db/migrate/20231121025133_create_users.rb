class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users, id: :uuid, default: -> { "gen_random_uuid()" }  do |t|
      t.string :name
      t.integer :age
      t.string :password_digest, null: false
      t.string :email, null: false

      t.timestamps
    end
  end
end
