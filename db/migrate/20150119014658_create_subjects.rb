class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :name, null: false

      t.timestamps null: false
    end

    add_column :flashcards, :subject_id, :integer, null: false
  end

end
