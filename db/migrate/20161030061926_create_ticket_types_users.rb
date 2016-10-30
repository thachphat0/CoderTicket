class CreateTicketTypesUsers < ActiveRecord::Migration
  def change
    create_table :ticket_types_users do |t|
      t.references :ticket_type, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
