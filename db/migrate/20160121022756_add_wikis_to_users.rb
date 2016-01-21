class AddWikisToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :wiki, index: true, foreign_key: true
  end
end
