class CreateChapters < ActiveRecord::Migration[6.0]
  def change
    create_table :chapters do |t|
      t.string :name
      t.text :url
      t.references :webnovel, null: false, foreign_key: true

      t.timestamps
    end
  end
end
