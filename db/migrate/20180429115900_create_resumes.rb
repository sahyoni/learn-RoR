class CreateResumes < ActiveRecord::Migration[5.1]
  def change
    create_table :resumes do |t|
      t.string :cover_letter
      t.string :title

      t.timestamps
    end
  end
end
