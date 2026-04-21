DROP SCHEMA IF EXISTS lana_dog_walking;
CREATE SCHEMA lana_dog_walking;
USE lana_dog_walking;

CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    phone_number VARCHAR(20),
    email VARCHAR(100)
);
-- =============================================
-- 2. Dogs table (independent - no foreign keys)
-- =============================================
CREATE TABLE Dogs (
    dog_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50),
    phone_number VARCHAR(20),
    email VARCHAR(100)
);
-- =============================================
-- 3. Walkers table (independent - no foreign keys)
-- =============================================
CREATE TABLE Walkers (
    walkers_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    phone_number VARCHAR(20),
    email VARCHAR(100)
);
-- =============================================
-- 4. Walks table (depends on Dogs and Walkers)
-- Foreign keys: dog_id references Dogs(dog_id)
-- walker_id references Walkers(walkers_id)
-- =============================================
CREATE TABLE Walks (
    walk_id INT AUTO_INCREMENT PRIMARY KEY,
    walk_date DATE NOT NULL,
    walk_time TIME NOT NULL,
    duration INT NOT NULL COMMENT 'Duration in minutes',
    status VARCHAR(20) DEFAULT 'scheduled',
    dog_id INT NOT NULL,
    walker_id INT NOT NULL,
    FOREIGN KEY (dog_id) REFERENCES Dogs(dog_id)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (walker_id) REFERENCES Walkers(walkers_id)
        ON DELETE RESTRICT ON UPDATE CASCADE
);
-- Optional: If you want to run this in a specific database, add at the top:
-- USE your_database_name;