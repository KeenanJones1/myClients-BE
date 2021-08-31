class CreateMyClients < ActiveRecord::Migration[6.0]
  def change
    create_table :my_clients do |t|
      t.references :user, null: false, foreign_key: true
      t.references :client, null: false, foreign_key: true
      t.float :coolness_rating, :default => 2
      t.float :tipped, :default => 5.00
      t.float :likelihood_to_return, :default => 1
      t.integer :visits, :default => 1

      t.timestamps
    end
  end
end
