class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :current_score, default: 0

      t.timestamps null: false
    end
  end
end
