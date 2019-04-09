class CreateTasks < ActiveRecord::Migration[5.0]
 def change
   create_table :tasks do |t|
     t.string :content
     t.string :name
     t.string :email
     t.string :password_digest

     t.timestamps
   end
 end
end