class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.date   :day,                   null:false
      t.string :time,                  null:false
      t.datetime :start_time,          null:false
      t.string :children_number_id,    null: false
      t.string :children_name,         null: false
      t.text   :allergy
      t.integer :age_id,               null: false
      t.string :nationality,           null: false
      t.string :phone_number,          null: false
      t.text   :contact
      t.integer :price,                null: false
      t.references :user,              null: false, foreign_key: true
    

      t.timestamps
    end
  end
end
