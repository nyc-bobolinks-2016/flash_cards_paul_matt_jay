class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.integer :correct, default: 0
      t.integer :wrong, default: 0
      t.integer :round_id
      t.timestamps
    end
  end
end
