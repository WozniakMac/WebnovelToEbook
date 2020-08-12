class AddWebnovelIdToEbook < ActiveRecord::Migration[6.0]
  def change
    add_column :ebooks, :webnovel_id, :integer
  end
end
