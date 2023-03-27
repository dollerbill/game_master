class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.references :campaign
      t.json :progress
      t.string :code
      t.boolean :active, default: true
      t.bigint :created_by_user_id
      t.timestamps
    end
  end
end
