class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.belongs_to :questionnaire, null: false, foreign_key: true
      t.text :name
      t.integer :question_type
      t.boolean :required

      t.timestamps
    end
  end
end
