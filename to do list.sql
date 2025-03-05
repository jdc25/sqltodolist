--Create our database, let the system know we want to use it
CREATE DATABASE my_todo_list;
USE my_todo_list;

--Create a table for tasks, increment with each new task added
CREATE TABLE tasks (
id INT AUTO_INCREMENT PRIMARY KEY, 
task_name VARCHAR(255) NOT NULL, 
completed BOOLEAN DEFAULT False
);

--Insert our tasks into the table
INSERT INTO tasks (task_name) VALUES ('Tidy Desk');
INSERT INTO tasks (task_name) VALUES ('Clean Living Room');
INSERT INTO tasks (task_name) VALUES ('Walk the dog');

--Display all tasks in the table
SELECT * FROM tasks;

--Delete the first task from the table
DELETE FROM tasks WHERE id = 1;

--Change the second task listed
UPDATE tasks SET task_name = 'Tidy the Kitchen' WHERE id = 2;

--Select the second task from the table to make sure it updated
SELECT * FROM tasks WHERE id = 2;

--Alter the tasks table to add a due date column
ALTER TABLE tasks ADD COLUMN due_date DATE;

--Insert a new task and it's due date into the tasks table
INSERT INTO tasks (task_name, due_date) VALUES ('Book Car MOT', '2025-03-05');

--Select all tasks by due date
SELECT * FROM tasks ORDER BY due_date ASC;

--Create a user table incrementing with each added
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY, 
    name VARCHAR(100) NOT NULL
);

/*
Add a user id integer to tasks, linking each task to a user, 
and create a foreign key for reference
*/
ALTER TABLE tasks ADD COLUMN user_id INT;
ALTER TABLE tasks ADD CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users(id);

--Insert users name and task into each table respectively
INSERT INTO users (name) VALUES ('Joe Bloggs');
INSERT INTO tasks (task_name, user_id) VALUES ('Go shopping', 1);

--Join tasks and users tables to view tasks assigned to users
SELECT tasks.task_name, users.name 
FROM tasks 
JOIN users ON tasks.user_id = users.id;


