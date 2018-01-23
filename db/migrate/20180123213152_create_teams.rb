class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :chaser
      t.string :beater
      t.string :keeper
      t.string :seeker
      t.integer :user_id
    end
  end
end
