class AddColumnToAnswers < ActiveRecord::Migration[7.0]
  def change
    add_column :answers, :is_correct, :boolean, default: false
  end
end
