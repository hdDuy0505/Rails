# frozen_string_literal: true
class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books, id: :uuid, default: -> { "gen_random_uuid()" } do |t|
      t.string :title, null: false
      t.string :author, null: false
      t.text :description, null: false
      t.float :price, null: false
      t.datetime :published_date, null: false

      t.timestamps
    end

  end
end
