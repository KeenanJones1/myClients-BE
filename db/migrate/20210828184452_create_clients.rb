class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string :first_name
      t.string :last_name
      t.string :occupation
      t.string :gender
      t.date :date_of_birth
      t.string :address
      t.string :phone_number
      t.string :email

      t.timestamps
    end
  end
end
