class CreateImaages < ActiveRecord::Migration[6.0]
  def change
    create_table :imaages do |t|
      t.references :albums, null: false, foreign_key: true

      t.timestamps
    end
  end
end
