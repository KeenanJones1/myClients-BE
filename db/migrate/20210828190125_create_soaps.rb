class CreateSoaps < ActiveRecord::Migration[6.0]
  def change
    create_table :soaps do |t|
      t.text :subject
      t.text :objective
      t.text :assessment
      t.text :plan
      t.text :notes
      t.references :my_client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
