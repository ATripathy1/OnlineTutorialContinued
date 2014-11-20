class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.string :program_name
      t.string :program_description
      t.integer :course_id

      t.timestamps
    end
  end
end
