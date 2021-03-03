class CreateFunctionalities < ActiveRecord::Migration[6.0]
  def change
    create_table :functionalities do |t|
      t.string :uuid, null: false, default: SecureRandom.uuid, length: 36
      t.string :name, null: false
      t.string :route, null: false

      t.json :variable_object, null: false
      t.json :function_definition, null: false

      t.json :registration_payload, null: false

      t.timestamps
    end

    add_index :functionalities, :uuid
  end
end
