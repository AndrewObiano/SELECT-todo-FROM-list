DROP TABLE IF EXISTS tasks;

CREATE TABLE tasks (
    id SERIAL PRIMARY KEY,
    title VARCHAR (255) NOT NULL,
    description text,
    created_at timestamp without time zone default now() NOT NULL,
    updated_at timestamp without time zone default now() NOT NULL,
    completed boolean NOT NULL
);

ALTER TABLE tasks
DROP completed;

ALTER TABLE tasks
ADD completed_at timestamp
DEFAULT NULL;

ALTER TABLE tasks
ALTER updated_at SET NOT NULL;

ALTER TABLE tasks
ALTER updated_at SET DEFAULT now();

INSERT INTO tasks
VALUES (default, 'Study SQL', 'Complete this exercise', now(), now(), NULL);

INSERT INTO tasks (title, description)
VALUES ('Study PostgresQL', 'Read all the documentation');

SELECT title
FROM tasks
WHERE completed_at is NULL;

UPDATE tasks
SET completed_at = now()
WHERE title = 'Study SQL';

SELECT title, description
FROM tasks
WHERE completed_at is NULL;

SELECT *
FROM tasks
ORDER BY created_at DESC;

INSERT INTO tasks (title, description)
VALUES ('mistake 1', 'a test entry');

INSERT INTO tasks (title, description)
VALUES ('mistake 2', 'another test entry');

INSERT INTO tasks (title, description)
VALUES ('third mistake', 'another test entry');

SELECT title
FROM tasks
WHERE title LIKE '%mistake%';

DELETE
FROM tasks
WHERE title = 'mistake 1';

SELECT title, description
FROM tasks
WHERE title LIKE '%mistake%';

DELETE
FROM tasks
WHERE title LIKE '%mistake%';

SELECT *
FROM tasks
ORDER BY title ASC;