class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :course_name
      t.string :course_description
      t.integer :program_id

      t.timestamps
    end
    #This will retrieve all my courses given a program id.
    add_index :courses, [:program_id, :created_at]
  end
end
