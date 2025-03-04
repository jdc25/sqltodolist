CREATE DATABASE my_todo_list;
USE my_todo_list;

CREATE TABLE tasks (
id INT AUTO_INCREMENT PRIMARY KEY, 
task_name VARCHAR(255) NOT NULL, 
completed BOOLEAN DEFAULT False
);

INSERT INTO tasks (task_name) VALUES ('Tidy Desk');
INSERT INTO tasks (task_name) VALUES ('Clean Living Room');
INSERT INTO tasks (task_name) VALUES ('Walk the dog');

SELECT * FROM tasks;

DELETE FROM tasks WHERE id = 1;

UPDATE tasks SET task_name = 'Tidy the Kitchen' WHERE id = 2;

SELECT * FROM tasks WHERE id = 2;

ALTER TABLE tasks ADD COLUMN due_date DATE;

INSERT INTO tasks (task_name, due_date) VALUES ('Book Car MOT', '2025-03-05');

SELECT * FROM tasks ORDER BY due_date ASC;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY, 
    name VARCHAR(100) NOT NULL
);

ALTER TABLE tasks ADD COLUMN user_id INT;
ALTER TABLE tasks ADD CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users(id);

INSERT INTO users (name) VALUES ('Joe Bloggs');
INSERT INTO tasks (task_name, user_id) VALUES ('Go shopping', 1);

SELECT tasks.task_name, users.name 
FROM tasks 
JOIN users ON tasks.user_id = users.id;


