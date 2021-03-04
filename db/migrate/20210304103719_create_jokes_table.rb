class CreateJokesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :jokes do |t|
      t.string :title
      t.string :genre
      t.text :punchline
      t.string :characters
      t.string :setting
    end
  end
end
