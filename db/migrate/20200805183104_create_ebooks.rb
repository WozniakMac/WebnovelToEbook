# frozen_string_literal: true

class CreateEbooks < ActiveRecord::Migration[6.0]
  def change
    create_table :ebooks do |t|
      t.string :title
      t.string :slug
      t.integer :status, null: false, default: 0
      t.integer :progress
      t.text :urls

      t.timestamps
    end
  end
end
