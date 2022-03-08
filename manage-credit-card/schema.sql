CREATE TABLE responsibles ( 
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  username VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL 
)

CREATE TABLE users ( 
  id INT PRIMARY KEY AUTO_INCREMENT,
  responsible_id INT,
  name VARCHAR(255) NOT NULL,
  username VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  CONSTRAINT FOREIGN KEY(responsible_id) REFERENCES responsibles(id)
);

CREATE INDEX responsible_id_on_users ON users(responsible_id);
