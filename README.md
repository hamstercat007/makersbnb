
Database setup
-----
Use the following commands to set up the databases.
```
$ Use the package manager Homebrew to install the PostgreSQL app.
brew install postgresql

$ Start the PostgreSQL server in the background and made it restart when you login.
brew services start postgresql

$ Start the psql interface.
psql

$ Create a database and a test database using SQL.
CREATE DATABASE makersbnb;
CREATE DATABASE makersbnb_test;

$ Within both databases, run the SQL queries saved in the './db/migrations' folder.

```

Managing the test tables
-----
Useful SQL commands to manage the tables within the test database are below.
```
INSERT INTO users VALUES(1, 'blue', 'andrew@gmail.com');
INSERT INTO users VALUES(2, 'red', 'bob@gmail.com');
INSERT INTO users VALUES(3, 'yellow', 'cat@gmail.com');
SELECT * FROM users;

INSERT INTO venues VALUES(1, 1, 'Penthouse', '4 bed overlooking the Thames', 1000.00);
INSERT INTO venues VALUES(2, 2, 'Villa', '3 bed with pool', 500.00);
INSERT INTO venues VALUES(3, 3, 'Chalet', '5 bed with fireplace', 750.50);
SELECT * FROM venues;

INSERT INTO bookings VALUES(1, 2, 3, '2021-10-09');
INSERT INTO bookings VALUES(2, 1, 3, '2021-12-25');
INSERT INTO bookings VALUES(3, 3, 2, '2022-07-05');
SELECT * FROM bookings;

```
