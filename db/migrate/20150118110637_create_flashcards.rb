class CreateFlashcards < ActiveRecord::Migration
  def change
    create_table :flashcards do |t|
      t.text      :question, null: false
      t.text      :answer, null: false
      t.integer   :author_id, null: false

      t.timestamps null: false
    end
  end
end
