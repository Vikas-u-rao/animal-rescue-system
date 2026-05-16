/* MySQL-compatible SCHEMA FOR ANIMAL RESCUE DATABASE */

-- Users table
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    role ENUM('admin','volunteer','staff') NOT NULL DEFAULT 'staff',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Reports table
CREATE TABLE IF NOT EXISTS reports (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    animal_type VARCHAR(50) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(255) NOT NULL,
    urgency ENUM('low','medium','high','critical') NOT NULL DEFAULT 'medium',
    status ENUM('pending','in_progress','resolved') NOT NULL DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Volunteers table
CREATE TABLE IF NOT EXISTS volunteers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    availability ENUM('available','on_mission','unavailable') NOT NULL DEFAULT 'available',
    skills TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    UNIQUE KEY uq_volunteer_user (user_id)
);

-- Assignments table
CREATE TABLE IF NOT EXISTS assignments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    report_id INT NOT NULL,
    volunteer_id INT NOT NULL,
    status ENUM('assigned','in_progress','completed') NOT NULL DEFAULT 'assigned',
    assigned_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (report_id) REFERENCES reports(id) ON DELETE CASCADE,
    FOREIGN KEY (volunteer_id) REFERENCES volunteers(id) ON DELETE CASCADE
);

-- Audit logs (track changes to reports/statuses)
CREATE TABLE IF NOT EXISTS audit_logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    report_id INT,
    user_id INT,
    action VARCHAR(255) NOT NULL,
    old_value VARCHAR(255),
    new_value VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (report_id) REFERENCES reports(id) ON DELETE SET NULL,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL
);

-- Sample dummy data for quick testing (optional)
INSERT INTO users (username, password, email, role) VALUES
('admin','replace_with_hashed_pw','admin@example.com','admin')
ON DUPLICATE KEY UPDATE username=username;

INSERT INTO users (username, password, email, role) VALUES
('vol1','replace_with_hashed_pw','vol1@example.com','volunteer')
ON DUPLICATE KEY UPDATE username=username;

INSERT INTO volunteers (user_id, availability, skills) VALUES
((SELECT id FROM users WHERE username='vol1'), 'available', 'animal-handling,first-aid')
ON DUPLICATE KEY UPDATE user_id=user_id;


