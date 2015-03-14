class CreatePrimeNumbers < ActiveRecord::Migration
  def change
    create_table :prime_numbers do |t|
      t.integer :prime_number
    end

    add_index :prime_numbers, :prime_number
  end
end
