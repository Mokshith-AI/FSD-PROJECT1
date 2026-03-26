CREATE DATABASE event_lifecycle;
USE event_lifecycle;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(150) UNIQUE,
    password VARCHAR(255),
    role ENUM('admin','user') DEFAULT 'user'
);

CREATE TABLE events (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255),
    category VARCHAR(100),
    description TEXT,
    location VARCHAR(100),
    event_date DATE,
    price DECIMAL(10,2),
    image VARCHAR(500)
);

CREATE TABLE bookings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    event_id INT,
    booking_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (event_id) REFERENCES events(id)
);

INSERT INTO events (title,category,description,location,event_date,price,image)
VALUES ('Lavaza','Concert','Premium music live experience','Chennai','2026-03-12',300,'images/Lavaza.jpg');
SELECT * FROM  bookings;
SELECT * FROM  events;
SELECT * FROM  users;
DELETE FROM events WHERE id=2;

UPDATE events
SET image = 'images/Lavaza.jpg.png'
WHERE id = 1;

DESC events;
DESC bookings;
DROP TABLE bookings;


ALTER TABLE bookings ADD COLUMN status VARCHAR(20) DEFAULT 'pending';
