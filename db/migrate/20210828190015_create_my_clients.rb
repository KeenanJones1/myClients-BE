class CreateMyClients < ActiveRecord::Migration[6.0]
  def change
    create_table :my_clients do |t|
      t.references :user, null: false, foreign_key: true
      t.references :client, null: false, foreign_key: true
      t.float :coolness_rating
      t.float :tipped
      t.float :likelihood_to_return
      t.integer :visits

      t.timestamps
    end
  end
end
