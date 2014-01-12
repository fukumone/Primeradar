class CreatePrimeNumbers < ActiveRecord::Migration
  def change
    create_table :prime_numbers do |t|
      t.integer :prime_number
    end
  end
end
