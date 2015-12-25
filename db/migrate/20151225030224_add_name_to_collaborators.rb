class AddNameToCollaborators < ActiveRecord::Migration
  def change
    add_reference :users, :name, index: true, foreign_key: true
  end
end
