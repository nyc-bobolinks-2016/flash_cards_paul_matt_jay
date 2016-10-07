class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.integer :correct
      t.integer :wrong
      t.integer :round_id
      t.timestamps
    end
  end
end
