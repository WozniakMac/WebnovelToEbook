class CreateWebnovels < ActiveRecord::Migration[6.0]
  def change
    create_table :webnovels do |t|
      t.string :title

      t.timestamps
    end
  end
end
