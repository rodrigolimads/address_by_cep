class CreateQueries < ActiveRecord::Migration
  def change
    create_table :queries do |t|
      t.string     :cep
      t.integer    :status, index: true
      t.text       :response
      t.timestamps null: false
    end
  end
end
