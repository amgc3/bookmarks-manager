<h1>User story 1</h1>

As an internet user, so that I see a list of websites that I use frequently,
I would like to see a list of bookmarks.

TO SET UP DATABASE

Connect to psql

Create the database using the psql command CREATE DATABASE bookmark_manager;

Connect to the database using the pqsl command \c bookmark_manager;

Run the query we have saved in the file 01_create_bookmarks_table.sql

TO SET UP A TEST DATABASE
run psql and use the query saved in
db/migrations/01_create_bookmarks_table.sql

$> psql
admin=# CREATE DATABASE "bookmark_manager_test";
admin=# CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, url VARCHAR(60));
