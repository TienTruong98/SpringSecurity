CREATE TABLE users(
	username VARCHAR(50) PRIMARY KEY,
	password VARCHAR(68) NOT NULL,
	enabled BIT NOT NULL
)

INSERT INTO users VALUES
('tien','{bcrypt}$2a$10$.FrN89imHODXZ331XjY2Yu67xgCr4q9huv1CSnGd9rQTZUOXa8sEu',1),
('khanh','{bcrypt}$2a$10$.FrN89imHODXZ331XjY2Yu67xgCr4q9huv1CSnGd9rQTZUOXa8sEu',1)


CREATE TABLE authorities(
	username VARCHAR (50) FOREIGN KEY REFERENCES users(username),
	authority VARCHAR(50),
	PRIMARY KEY (username, authority)
	
)

INSERT INTO authorities VALUES
('tien','ROLE_EMPLOYEE'),
('tien','ROLE_ADMIN'),
('khanh','ROLE_EMPLOYEE')


