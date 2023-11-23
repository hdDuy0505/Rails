# frozen_string_literal: true
class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books, id: :uuid, default: -> { "gen_random_uuid()" } do |t|
      t.text :content, null: false
      t.string :name, null: false
      t.string :author, null: false
      t.time :publisher, null: false

      t.timestamps
    end

  end
end
