class CreateAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :answers do |t|
      t.belongs_to :question, null: false, foreign_key: true
      t.text :name

      t.timestamps
    end
  end
end
