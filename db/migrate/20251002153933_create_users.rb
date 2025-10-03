class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false, index: { unique: true }
      t.string :password, null: false
      t.string :document, null: false, index: { unique: true }
      t.integer :role, null: false, default: 0
      t.integer :status, null: false, default: 0
      t.timestamps
    end
  end
end
