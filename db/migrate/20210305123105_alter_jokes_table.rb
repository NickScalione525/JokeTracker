class AlterJokesTable < ActiveRecord::Migration[5.2]
  def change
    add_column(:jokes, :user_id, :integer)  
  end
end

