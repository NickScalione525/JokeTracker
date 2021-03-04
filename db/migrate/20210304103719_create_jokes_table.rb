class CreateJokesTable < ActiveRecord::Migration[6.1]
  def change
    create_table :jokes do |t|
      t.string :title
      t.string :type
      t.text :punchline
      t.string :characters
      t.string :setting
  end
end
