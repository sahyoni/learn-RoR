class Admin < ApplicationRecord
	validates :first_name ,:presence=>true, length: {maximum:25,minimum:3} #first name should not be empty && max->25 litters min->3 litters

end
# here all the validation should be writen here
# here we represent the admin table in our database
# to read the data inside this model 'Admin' we need a controller 'admins_controller'

# validates(attributes) <<<<<<<<<<<<<<<<<
# validates :terms, acceptance: true
# validates :password, confirmation: true
# validates :username, exclusion: { in: %w(admin superuser) }
# validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
# validates :age, inclusion: { in: 0..9 }
# validates :first_name, length: { maximum: 30 }
# validates :age, numericality: true
# validates :username, presence: true



# controller name usually with 's' model name usually without 's' view some thing doesn't matter
# controller read the info from the model and the view show them


# all Admins columns represent on this class (object) admin ex: id, first_name, last_name, age -> so we can access any of them through this object 'admin'
# mysql -u root -p
# rails c

# new_admin= Admin.new
#    (16.7ms)  SET NAMES utf8,  @@SESSION.sql_mode = CONCAT(CONCAT(@@sql_mode, ',STRICT_ALL_TABLES'), ',NO_AUTO_VALUE_ON_ZERO'),  @@SESSION.sql_auto_is_null = 0, @@SESSION.wait_timeout = 2147483
# => #<Admin id: nil, first_name: nil, last_name: nil, age: 18, salary: nil, DOB: nil, created_at: nil, updated_at: nil>

# #new_admin= Admin.new
#    (16.7ms)  SET NAMES utf8,  @@SESSION.sql_mode = CONCAT(CONCAT(@@sql_mode, ',STRICT_ALL_TABLES'), ',NO_AUTO_VALUE_ON_ZERO'),  @@SESSION.sql_auto_is_null = 0, @@SESSION.wait_timeout = 2147483
# => #<Admin id: nil, first_name: nil, last_name: nil, age: 18, salary: nil, DOB: nil, created_at: nil, updated_at: nil>

# #new_admin= Admin.new <<<<<<<<<<< here we have to save it after creating 'new_admin.save' >>>>>>>>>>>>>
#    (16.7ms)  SET NAMES utf8,  @@SESSION.sql_mode = CONCAT(CONCAT(@@sql_mode, ',STRICT_ALL_TABLES'), ',NO_AUTO_VALUE_ON_ZERO'),  @@SESSION.sql_auto_is_null = 0, @@SESSION.wait_timeout = 2147483
# => #<Admin id: nil, first_name: nil, last_name: nil, age: 18, salary: nil, DOB: nil, created_at: nil, updated_at: nil>

# #new_admin.save <<<<<<<<<<<(here we save the record in our database)>>>>>>>>>>>
#    (0.2ms)  BEGIN
#   SQL (21.5ms)  INSERT INTO `admins` (`first_name`, `last_name`, `created_at`, `updated_at`) VALUES ('mohammad', 'sahyoni', '2018-04-27 23:46:28', '2018-04-27 23:46:28')
#    (44.2ms)  COMMIT
# => true
#<<<<<<<<<<<<< here we creat new recorde but this way we don't have to say 'new_admin.save' it save automatically>>>>>>>>
# raneem_admin= Admin.new(:first_name=>"raneem",:last_name=>"wanly")
# => #<Admin id: nil, first_name: "raneem", last_name: "wanly", age: 18, salary: nil, DOB: nil, created_at: nil, updated_at: nil>

#----------------------------------------------------

# show databases;
# +-----------------------+
# | Database              |
# +-----------------------+
# | information_schema    |
# | learn_ror_development |
# | mysql                 |
# | performance_schema    |
# | sys                   |
# +-----------------------+
# 5 rows in set (0,02 sec)

# mysql> use learn_ror_development
# Reading table information for completion of table and column names
# You can turn off this feature to get a quicker startup with -A

# Database changed
# mysql> show tables;
# +---------------------------------+
# | Tables_in_learn_ror_development |
# +---------------------------------+
# | admins                          |
# | ar_internal_metadata            |
# | schema_migrations               |
# | users                           |
# +---------------------------------+
# 4 rows in set (0,00 sec)

# mysql> descripe admins
#     -> ;
# ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'descripe admins' at line 1
# mysql> describe admins;
# +------------+-------------+------+-----+---------+----------------+
# | Field      | Type        | Null | Key | Default | Extra          |
# +------------+-------------+------+-----+---------+----------------+
# | id         | bigint(20)  | NO   | PRI | NULL    | auto_increment |
# | first_name | varchar(25) | NO   |     | NULL    |                |
# | last_name  | varchar(25) | NO   |     | NULL    |                |
# | age        | int(11)     | YES  |     | 18      |                |
# | salary     | float       | YES  |     | NULL    |                |
# | DOB        | datetime    | YES  |     | NULL    |                |
# | created_at | datetime    | NO   |     | NULL    |                |
# | updated_at | datetime    | NO   |     | NULL    |                |
# +------------+-------------+------+-----+---------+----------------+
# 8 rows in set (0,00 sec)

# mysql> select * from admins
#     -> ;
# +----+------------+-----------+------+--------+------+---------------------+---------------------+
# | id | first_name | last_name | age  | salary | DOB  | created_at          | updated_at          |
# +----+------------+-----------+------+--------+------+---------------------+---------------------+
# |  1 | mohammad   | sahyoni   |   26 |   2600 | NULL | 2018-04-22 21:49:14 | 2018-04-22 21:49:14 |
# |  2 | mohammad   | sahyoni   |   18 |   NULL | NULL | 2018-04-27 23:46:28 | 2018-04-27 23:46:28 |
# +----+------------+-----------+------+--------+------+---------------------+---------------------+
# 2 rows in set (0,01 sec)

#--------------------------------------------------------------
# Find by id
# user=Admin.find(2) <<<<<<<<<<<<<<< by ID
#   Admin Load (1.0ms)  SELECT  `admins`.* FROM `admins` WHERE `admins`.`id` = 2 LIMIT 1
# => #<Admin id: 2, first_name: "mohammad", last_name: "sahyoni", age: 18, salary: nil, DOB: nil, created_at: "2018-04-27 23:46:28", updated_at: "2018-04-27 23:46:28">

# find by one or more conditions:
# m=Admin.where(:age=>18) <<<<<<<<<<<<<<<<<< (1)
#   Admin Load (3.0ms)  SELECT  `admins`.* FROM `admins` WHERE `admins`.`age` = 18 LIMIT 11
# => #<ActiveRecord::Relation [#<Admin id: 2, first_name: "mohammad", last_name: "sahyoni", age: 18, salary: nil, DOB: nil, created_at: "2018-04-27 23:46:28", updated_at: "2018-04-27 23:46:28">, #<Admin id: 3, first_name: "raneem", last_name: "wanly", age: 18, salary: nil, DOB: nil, created_at: "2018-04-28 00:14:28", updated_at: "2018-04-28 00:14:28">]
# m=Admin.where("age>18") <<<<<<<<<<<<<<<<<< (2)
#   Admin Load (0.8ms)  SELECT  `admins`.* FROM `admins` WHERE (age>18) LIMIT 11
# => #<ActiveRecord::Relation [#<Admin id: 1, first_name: "mohammad", last_name: "sahyoni", age: 26, salary: 2600.0, DOB: nil, created_at: "2018-04-22 21:49:14", updated_at: "2018-04-22 21:49:14">]>
# m=Admin.where("age>?",18) <<<<<<<<<<<<<<<<<<< (2)  'same as (2)'
#   Admin Load (0.9ms)  SELECT  `admins`.* FROM `admins` WHERE (age>18) LIMIT 11
# => #<ActiveRecord::Relation [#<Admin id: 1, first_name: "mohammad", last_name: "sahyoni", age: 26, salary: 2600.0, DOB: nil, created_at: "2018-04-22 21:49:14", updated_at: "2018-04-22 21:49:14">]>
# m=Admin.where("age>? and age<?",18,60) <<<<<<<<<<<<<<<<<<<< (3)
# m=Admin.where(["age>? or age<?",18,60]) <<<<<<<<<<<<<<<<<<<< (4)
# m=Admin.where("age>?",18).limit(2) <<<<<<<<<<<<<<<<<<<<< (5) 'give me only tow result in case of there is many results'
# m=Admin.offset(2).order("first_name ASC") <<<<<<<<<<<<(6) 'this means ignore the first record and start from the second one then order by first_name increasement' ASC increasement DESC decreasement 
# m=Admin.where(:age=>18,:first_name=>"raneem") <<<<<<<<<<<<<< (7)
#   Admin Load (0.7ms)  SELECT  `admins`.* FROM `admins` WHERE `admins`.`age` = 18 AND `admins`.`first_name` = 'raneem' LIMIT 11
# => #<ActiveRecord::Relation [#<Admin id: 3, first_name: "raneem", last_name: "wanly", age: 18, salary: nil, DOB: nil, created_at: "2018-04-28 00:14:28", updated_at: "2018-04-28 00:14:28">]>

# if we want to UPDATE:
# m= Admin.find(2)
# m.DOB="1990-02-20"
# m.save

# if we want to DELETE
# m= Admin.find(2)
# m.destroy

# P.S: 'finde' give u 1 recorde 'where' give u many records