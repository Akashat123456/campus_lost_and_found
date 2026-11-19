CREATE DATABASE IF NOT EXISTS smart_campus_lost_found CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE smart_campus_lost_found;

CREATE TABLE users (
 id INT AUTO_INCREMENT PRIMARY KEY,
 name VARCHAR(120) NOT NULL,
 email VARCHAR(190) NOT NULL UNIQUE,
 student_id VARCHAR(60) NULL,
 password VARCHAR(255) NOT NULL,
 role ENUM('student','admin') NOT NULL DEFAULT 'student',
 is_active TINYINT(1) NOT NULL DEFAULT 1,
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE items (
 id INT AUTO_INCREMENT PRIMARY KEY,
 user_id INT NOT NULL,
 type ENUM('lost','found') NOT NULL,
 title VARCHAR(120) NOT NULL,
 category VARCHAR(80) NOT NULL,
 description TEXT NOT NULL,
 location VARCHAR(180) NOT NULL,
 item_date DATE NOT NULL,
 image VARCHAR(255) NULL,
 status ENUM('lost','found','returned','closed') NOT NULL,
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
 INDEX idx_items_status_type (status,type),
 INDEX idx_items_title (title)
) ENGINE=InnoDB;

CREATE TABLE claims (
 id INT AUTO_INCREMENT PRIMARY KEY,
 item_id INT NOT NULL,
 user_id INT NOT NULL,
 message TEXT NOT NULL,
 status ENUM('pending','approved','rejected') NOT NULL DEFAULT 'pending',
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 UNIQUE KEY unique_claim (item_id,user_id),
 FOREIGN KEY (item_id) REFERENCES items(id) ON DELETE CASCADE,
 FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- After importing, create your admin by registering a normal account first,
-- then run this query in phpMyAdmin, replacing the email:
-- UPDATE users SET role='admin' WHERE email='admin@yourcollege.edu';
