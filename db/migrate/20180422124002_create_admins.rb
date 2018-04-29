class CreateAdmins < ActiveRecord::Migration[5.1]
  def up # event name is change
    create_table :admins do |t| # (t)=column create_table is action
    	t.string "first_name", :limit=> 25,:null=>false # here we add some condition to this column
    	t.string "last_name", :limit=>25, :null=>false # limit of strings (25) can not be null
    	t.integer "age", :default=>18 # default value '18' if there is no input value so it take '18' by default
    	t.float "salary" # here there is no condition
    	t.datetime "DOB" # type of column, space, name of column, space, conditions

      t.timestamps # creat_at update_at
    end
  end
  def down # when admin down we can go to the previous version of our database then edit 'Admin' then again make it up to update the changes
  	drop_table :admins # delete table 'Admin'
  end
end
# after each edit we have to run (rake db:migrate)
# to check our updates
# mysql -> show databases; -> use databasename; -> show tables; -> describe tablename;

# WAY(1): rake db:migrate:status -> then we chose one of the previous 'Migration ID' -> rake db:migrate VERSION=1231548950165(Migration ID)
# WAY(2) if we want to add a column to an exist table instead of go to the previous version update and return to the new one
# we can add new migration like by doing the following:
# 1-rails g migration nameofmigration(ex:addcolumn)
# 2- then in the migration file that created add:
# 3- class addcolumn
# def up
# add_column("Admin","salary",:string)
# end

# add_column is a method already exist in the sql sys 'it allowed us to add new column'
# like add_column('TableName','TheNewColumnName',:TypeOfColumn)
# we have alot of other methods like: remove_column - rename - change - add index .....
# //here we set first the table name where we want to add the new column
# //second we type the name of the new column that we want to add.
# //third we declare the type of this column 'string, int,float'

# table ==> create - drop
# columns ==> add - remove

# class CreateUsers < ActiveRecord::Migration[5.1]
# def change
#   create_table :users do |t|
#    t.timestamps
#  end
# end
# def down 
#    drop_table :admins
# end

# def up
# add_column("Admin","salary",:string)
# end
# def down
# remove_column("Admin","salary",:string)
# end
# end

# rake db:schema:dump (this will check if our database working well - if there is any problem will return a message with the occured error)
# rake db:migrate (works on development mode by default) -> we have this three modes development: test: production: -> they are in the database.yml File.
# if we want to change migration default mode -> rake db:migrate RAILS_ENV=production