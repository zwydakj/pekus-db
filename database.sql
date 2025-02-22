-- Pekus Database Schema
-- Description: This script sets up the database schema for a fictional streaming service.
-- Created as part of a group project during studies.
-- Sample data included for testing purposes.

-- Creating and Selecting the Database 

CREATE DATABASE pekus;

USE pekus;


-- Create a table for storing user data 

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(200),
    last_name VARCHAR(200),
    email VARCHAR(150),
    account_status ENUM('active', 'inactive', 'pending')
);
ALTER TABLE users AUTO_INCREMENT = 1;
ALTER TABLE users CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;


-- Create a table to store login data 

CREATE TABLE login_data (
    id INT,
    username VARCHAR(150),
    password VARCHAR(64), 
    join_date DATE,
    FOREIGN KEY (id) REFERENCES users(id) ON DELETE CASCADE
);
ALTER TABLE login_data CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;


-- Trigger to automatically generate and securely hash login data 

CREATE TRIGGER generate_login_data
AFTER INSERT ON users
FOR EACH ROW
BEGIN
    INSERT INTO login_data (id, username, password, join_date)
    VALUES (
        NEW.id, 
        CONCAT(NEW.first_name, NEW.id), 
        SHA2(CONCAT(REVERSE(NEW.first_name), '.', NEW.id), 256), 
        NOW()
    );
END;


-- Insert some sample data into the users table

INSERT INTO users (first_name, last_name, email) VALUES
('Krzysztof', 'Kowalski', 'krzysztof.kowalski@pekus.com'),
('Aleksandra', 'Zalewska', 'aleksandra.zalewska@pekus.com'),
('Patryk', 'Szymański', 'patryk.szymanski@pekus.com'),
('Michał', 'Nowak', 'michal.nowak@pekus.com'),
('Natalia', 'Wiśniewska', 'natalia.wisniewska@pekus.com'),
('Joanna', 'Grabowska', 'joanna.grabowska@pekus.com'),
('Dawid', 'Dąbrowski', 'dawid.dabrowski@pekus.com'),
('Daniel', 'Kowalczyk', 'daniel.kowalczyk@pekus.com'),
('Jan', 'Kowalczyk', 'jan.kowalczyk@pekus.com'),
('Weronika', 'Kowalczyk', 'weronika.kowalczyk@pekus.com'),
('Piotr', 'Karpierz', 'piotr.karpierz@pekus.com'),
('Katarzyna', 'Kowal', 'katarzyna.kowal@pekus.com'),
('Piotr', 'Lewandowski', 'piotr.lewandowski@pekus.com'),
('Natalia', 'Nowakowska', 'natalia.nowakowska@pekus.com'),
('Tomasz', 'Wójcik', 'tomasz.wojcik@pekus.com'),
('Natalia', 'Wójcik', 'natalia.wojcik@pekus.com'),
('Antoni', 'Kamiński', 'antoni.kaminski@pekus.com'),
('Michał', 'Wójcik', 'michal.wojcik@pekus.com'),
('Aneta', 'Wójcik', 'aneta.wojcik@pekus.com'),
('Joanna', 'Nowakowska', 'joanna.nowakowska@pekus.com'),
('Tomasz', 'Kowalski', 'tomasz.kowalski@pekus.com'),
('Weronika', 'Mazur', 'weronika.mazur@pekus.com'),
('Aneta', 'Kamińska', 'aneta.kaminska@pekus.com'),
('Katarzyna', 'Wiśniewska', 'katarzyna.wisniewska@pekus.com'),
('Dawid', 'Wiśniewski', 'dawid.wisniewski@pekus.com'),
('Dawid', 'Szymański', 'dawid.szymanski@pekus.com'),
('Daniel', 'Kowal', 'daniel.kowal@pekus.com'),
('Weronika', 'Zielińska', 'weronika.zielinska@pekus.com'),
('Karol', 'Nowak', 'karol.nowak@pekus.com'),
('Agnieszka', 'Mazur', 'agnieszka.mazur@pekus.com'),
('Joanna', 'Kamińska', 'joanna.kaminska@pekus.com'),
('Katarzyna', 'Wójcik', 'katarzyna.wojcik@pekus.com'),
('Jan', 'Wójcik', 'jan.wojcik@pekus.com'),
('Dominik', 'Kamiński', 'dominik.kaminski@pekus.com'),
('Karolina', 'Dąbrowska', 'karolina.dabrowska@pekus.com'),
('Agnieszka', 'Wójcik', 'agnieszka.wojcik@pekus.com'),
('Dawid', 'Kowalczyk', 'dawid.kowalczyk@pekus.com'),
('Marcin', 'Karpierz', 'marcin.karpierz@pekus.com'),
('Anna', 'Kowal', 'anna.kowal@pekus.com'),
('Jan', 'Wiśniewski', 'jan.wisniewski@pekus.com'),
('Dominik', 'Ptak', 'dominik.ptak@pekus.com'),
('Marcin', 'Lewandowski', 'marcin.lewandowski@pekus.com'),
('Daniel', 'Grabowski', 'daniel.grabowski@pekus.com'),
('Katarzyna', 'Zielińska', 'katarzyna.zielinska@pekus.com'),
('Karol', 'Wójcik', 'karol.wojcik@pekus.com'),
('Michał', 'Dąbrowski', 'michal.dabrowski@pekus.com'),
('Karol', 'Wiśniewski', 'karol.wiśniewski@pekus.com'),
('Weronika', 'Dąbrowska', 'weronika.dąbrowska@pekus.com'),
('Dominik', 'Grabowski', 'dominik.grabowski@pekus.com'),
('Joanna', 'Zielińska', 'joanna.zielińska@pekus.com'),
('Weronika', 'Walczak', 'weronika.walczak@pekus.com'),
('Natalia', 'Lewandowska', 'natalia.lewandowska@pekus.com'),
('Piotr', 'Kamiński', 'piotr.kamiński@pekus.com'),
('Paweł', 'Nowakowski', 'paweł.nowakowski@pekus.com'),
('Piotr', 'Kowalski', 'piotr.kowalski@pekus.com'),
('Dominik', 'Kowalski', 'dominik.kowalski@pekus.com'),
('Agnieszka', 'Grabowska', 'agnieszka.grabowska@pekus.com'),
('Katarzyna', 'Lewandowska', 'katarzyna.lewandowska@pekus.com'),
('Marcin', 'Nowakowski', 'marcin.nowakowski@pekus.com'),
('Karolina', 'Wójcik', 'karolina.wójcik@pekus.com'),
('Paweł', 'Kamiński', 'paweł.kamiński@pekus.com'),
('Radosław', 'Kowalczyk', 'radosław.kowalczyk@pekus.com'),
('Krzysztof', 'Wiśniewski', 'krzysztof.wiśniewski@pekus.com'),
('Krzysztof', 'Kowalczyk', 'krzysztof.kowalczyk@pekus.com'),
('Wanda', 'Karpierz', 'wanda.karpierz@pekus.com'),
('Magdalena', 'Nowakowska', 'magdalena.nowakowska@pekus.com'),
('Marcin', 'Szymański', 'marcin.szymański@pekus.com'),
('Klara', 'Kamińska', 'klara.kamińska@pekus.com'),
('Damian', 'Nowakowski', 'damian.nowakowski@pekus.com'),
('Agata', 'Kowal', 'agata.kowal@pekus.com'),
('Maria', 'Dąbrowska', 'maria.dąbrowska@pekus.com'),
('Maria', 'Nowak', 'maria.nowak@pekus.com'),
('Damian', 'Kamiński', 'damian.kamiński@pekus.com'),
('Maria', 'Zielińska', 'maria.zielińska@pekus.com'),
('Agata', 'Kowalczyk', 'agata.kowalczyk@pekus.com'),
('Klara', 'Karpierz', 'klara.karpierz@pekus.com'),
('Jakub', 'Karpierz', 'jakub.karpierz@pekus.com'),
('Agata', 'Grabowska', 'agata.grabowska@pekus.com'),
('Damian', 'Kowalczyk', 'damian.kowalczyk@pekus.com'),
('Lena', 'Wójcik', 'lena.wójcik@pekus.com'),
('Wanda', 'Walczak', 'wanda.walczak@pekus.com'),
('Aleksandra', 'Szymańska', 'aleksandra.szymańska@pekus.com'),
('Damian', 'Mazur', 'dominik.mazur@pekus.com'),
('Aleksandra', 'Kowalska', 'aleksandra.kowalska@pekus.com'),
('Piotr', 'Kowal', 'piotr.kowal@pekus.com'),
('Nadia', 'Kowalczyk', 'nadia.kowalczyk@pekus.com'),
('Robert', 'Kowal', 'robert.kowal@pekus.com'),
('Marcin', 'Nowakowski', 'marcin.nowakowski@pekus.com'),
('Sylwia', 'Nowakowska', 'sylwia.nowakowska@pekus.com'),
('Klara', 'Kowalczyk', 'klara.kowalczyk@pekus.com'),
('Klara', 'Karpierz', 'klara.karpierz@pekus.com'),
('Mateusz', 'Karpierz', 'mateusz.karpierz@pekus.com'),
('Magdalena', 'Kowal', 'magdalena.kowal@pekus.com'),
('Sylwia', 'Nowak', 'sylwia.nowak@pekus.com'),
('Patryk', 'Wójcik', 'patryk.wójcik@pekus.com'),
('Aleksandra', 'Lewandowska', 'aleksandra.lewandowska@pekus.com'),
('Zuzanna', 'Karpierz', 'zuzanna.karpierz@pekus.com'),
('Kinga', 'Walczak', 'kinga.walczak@pekus.com'),
('Dawid', 'Lewandowski', 'dawid.lewandowski@pekus.com'),
('Tomasz', 'Lewandowski', 'tomasz.lewandowski@pekus.com');


-- Update account status based on user ID ranges

UPDATE users
SET account_status = CASE
    WHEN id BETWEEN 1 AND 80 THEN 'active'
    WHEN id BETWEEN 81 AND 90 THEN 'pending'
    WHEN id BETWEEN 91 AND 100 THEN 'inactive'
END;


-- Create a table to store subscription plan details for users

CREATE TABLE subscription_plan (
    id INT,
    first_name VARCHAR(200),
    last_name VARCHAR(200),
    plan ENUM('demo', 'standard', 'premium'),
    price INT,
    start_date DATE,
    end_date DATE,
    status ENUM('active', 'inactive', 'pending'),
    FOREIGN KEY (id) REFERENCES users(id)
);
ALTER TABLE subscription_plan CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;


-- Create a table to store payment details for users

CREATE TABLE payments (
    id INT,
    username VARCHAR(150),
    payment_method ENUM('transfer', 'blik'),
    payment_date DATE,
    FOREIGN KEY (id) REFERENCES users(id)
);
ALTER TABLE payments CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;


-- Insert user data into the subscription_plan table based on their account status

INSERT INTO subscription_plan (id, first_name, last_name, status)
SELECT id, first_name, last_name, account_status 
FROM users;


-- Insert login data into the payments table, matching user ID and username

INSERT INTO payments (id, username)
SELECT id, username 
FROM login_data;


-- Randomly assign subscription plans to users based on their IDs

UPDATE subscription_plan
SET plan = CASE
    WHEN id IN (29, 32, 3, 63, 34, 2, 84, 96, 93, 58, 85, 33, 
                13, 67, 87, 53, 39, 35, 44, 69, 95, 57, 70, 99, 
                7, 73, 65, 71, 100, 15, 11, 28, 98, 14, 97, 27, 
                36, 18, 17, 23, 48, 72, 77, 60, 50, 59, 40, 24, 
                37, 76, 38, 55, 80, 26, 25, 47, 21, 4, 66, 56) THEN 'premium'
    WHEN id IN (54, 81, 22, 49, 30, 45, 83, 90, 42, 74, 19, 
                43, 88, 31, 78, 16, 64, 6, 1, 12) THEN 'demo'
    WHEN id IN (5, 8, 9, 10, 20, 41, 46, 51, 52, 61, 62, 68, 
                75, 79, 82, 86, 89, 91, 92, 94) THEN 'standard'
    ELSE plan
END;


-- Randomly assign payment methods to users based on their IDs

UPDATE payments
SET payment_method = CASE
    WHEN id IN (79, 91, 38, 81, 73, 70, 14, 1, 39, 20, 64, 
                100, 61, 18, 36, 23, 68, 42, 32, 26, 4, 90, 72, 
                8, 7, 45, 24, 85, 12, 3, 11, 5, 65, 31, 88, 84, 
                46, 78, 51, 71, 9, 99, 92, 25, 47, 30, 52, 35, 53, 
                60, 82, 59, 49, 97, 34, 13, 29, 54, 58, 67) THEN 'blik'
    WHEN id IN (2, 6, 10, 15, 16, 17, 19, 21, 22, 27, 28, 33, 
                37, 40, 41, 43, 44, 48, 50, 55, 56, 57, 62, 63, 
                66, 69, 74, 75, 76, 77, 80, 83, 86, 87, 89, 93, 
                94, 95, 96, 98) THEN 'transfer'
    ELSE payment_method
END;


-- Procedure to update payment dates based on the join date of users

CREATE PROCEDURE update_payment_date()
BEGIN
    UPDATE payments p
    JOIN login_data d ON p.username = d.username
    SET p.payment_date = DATE_ADD(d.join_date, INTERVAL 1 DAY)
    WHERE p.payment_method = 'blik';

    UPDATE payments p
    JOIN login_data d ON p.username = d.username
    SET p.payment_date = DATE_ADD(d.join_date, INTERVAL 4 DAY)
    WHERE p.payment_method = 'transfer';
END;


CALL update_payment_date();


-- Update subscription start date based on payment date

UPDATE subscription_plan sp
JOIN payments p ON sp.id = p.id
SET sp.start_date = p.payment_date;


-- Set end date for 'demo' plan subscriptions to 1 month after start date

UPDATE subscription_plan
SET end_date = DATE_ADD(start_date, INTERVAL 1 MONTH)
WHERE plan = 'demo';


-- Set end date for 'standard' plan subscriptions to 3 months after start date

UPDATE subscription_plan
SET end_date = DATE_ADD(start_date, INTERVAL 3 MONTH)
WHERE plan = 'standard';


-- Set end date for 'premium' plan subscriptions to 6 months after start date

UPDATE subscription_plan
SET end_date = DATE_ADD(start_date, INTERVAL 6 MONTH)
WHERE plan = 'premium';


-- Procedure to update subscription plan prices

CREATE PROCEDURE update_prices()
BEGIN
    UPDATE subscription_plan
    SET price = CASE
        WHEN plan = 'demo' THEN 0
        WHEN plan = 'standard' THEN 50
        WHEN plan = 'premium' THEN 100
        ELSE price
    END;
END;


CALL update_prices();


-- Create a table to store employee information and their tasks

CREATE TABLE employees (
    employee_number VARCHAR(100) PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(150),
    tasks VARCHAR(200),
    salary INT,
    permissions ENUM('advanced', 'basic', 'intermediate'),
    handled_errors VARCHAR(50)
);


-- Insert sample employee data with tasks and permissions

INSERT INTO employees (employee_number, first_name, last_name, 
    tasks, salary, permissions, handled_errors) 
VALUES 
    ('E1', 'Anna', 'Kowalska', 'Customer service', 4200, 'basic', 'E.1'),
    ('E2', 'Jan', 'Nowak', 'Project management', 6800, 'advanced', '0'),
    ('E3', 'Piotr', 'Wiśniewski', 'Customer service', 5400, 'intermediate', 'E.3'),
    ('E4', 'Ewa', 'Kozłowska', 'Technical support', 4700, 'basic', '0'),
    ('E5', 'Marek', 'Zieliński', 'System architecture', 4000, 'advanced', '0'),
    ('E6', 'Katarzyna', 'Wójcik', 'Testing', 4900, 'intermediate', '0'),
    ('E7', 'Tomasz', 'Nowicki', 'Customer service', 4500, 'basic', 'E.9'),
    ('E8', 'Barbara', 'Jankowska', 'UX design', 6200, 'advanced', '0'),
    ('E9', 'Paweł', 'Szymański', 'Customer service', 5200, 'intermediate', 'E.2'),
    ('E10', 'Agnieszka', 'Kwiatkowska', 'Technical support', 4000, 'basic', '0'),
    ('E11', 'Grzegorz', 'Zając', 'Database management', 7600, 'advanced', '0'),
    ('E12', 'Natalia', 'Majewska', 'Testing', 4700, 'intermediate', '0'),
    ('E13', 'Kamil', 'Olszewski', 'Customer service', 4800, 'basic', 'E.4'),
    ('E14', 'Joanna', 'Pawlak', 'Programming', 7900, 'advanced', '0'),
    ('E15', 'Adam', 'Górski', 'System administration', 6100, 'intermediate', '0'),
    ('E16', 'Monika', 'Wójcik', 'Customer service', 4400, 'basic', 'E.7'),
    ('E17', 'Łukasz', 'Zieliński', 'Customer service', 4600, 'basic', 'E.5'),
    ('E18', 'Zofia', 'Pawlak', 'Customer service', 4300, 'basic', 'E.10'),
    ('E19', 'Karol', 'Jankowski', 'Customer service', 4500, 'basic', 'E.6'),
    ('E20', 'Maria', 'Nowicka', 'Customer service', 4700, 'basic', 'E.8');


-- Create a table to store errors reported by users and handled by employees

CREATE TABLE errors (
    error_code VARCHAR(50),
    user_id INT,
    error_type VARCHAR(100),
    employee_id VARCHAR(100),
    reported_time DATE,
    resolved_time DATE,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_number)
);

-- Insert random error data for users with corresponding reported and resolved times

INSERT INTO errors (error_code, user_id, error_type, 
    reported_time, resolved_time) 
VALUES 
    ('E.1', (SELECT id FROM users ORDER BY RAND() LIMIT 1), 'No account access', '2025-01-20', DATE_ADD('2025-01-20', INTERVAL 7 DAY)), 
    ('E.2', (SELECT id FROM users ORDER BY RAND() LIMIT 1), 'Payment issues', '2025-01-21', DATE_ADD('2025-01-21', INTERVAL 7 DAY)), 
    ('E.3', (SELECT id FROM users ORDER BY RAND() LIMIT 1), 'Mobile app malfunction', '2025-01-22', DATE_ADD('2025-01-22', INTERVAL 7 DAY)), 
    ('E.4', (SELECT id FROM users ORDER BY RAND() LIMIT 1), 'Video playback error', '2025-01-23', DATE_ADD('2025-01-23', INTERVAL 7 DAY)), 
    ('E.5', (SELECT id FROM users ORDER BY RAND() LIMIT 1), 'Device sync problem', '2025-01-24', DATE_ADD('2025-01-24', INTERVAL 7 DAY)), 
    ('E.6', (SELECT id FROM users ORDER BY RAND() LIMIT 1), 'Video loading delays', '2025-01-25', DATE_ADD('2025-01-25', INTERVAL 7 DAY)), 
    ('E.7', (SELECT id FROM users ORDER BY RAND() LIMIT 1), 'Login error via social media', '2025-01-26', DATE_ADD('2025-01-26', INTERVAL 7 DAY)), 
    ('E.8', (SELECT id FROM users ORDER BY RAND() LIMIT 1), 'Search function malfunction', '2025-01-27', DATE_ADD('2025-01-27', INTERVAL 7 DAY)), 
    ('E.9', (SELECT id FROM users ORDER BY RAND() LIMIT 1), 'Playlist playback error', '2025-01-20', DATE_ADD('2025-01-20', INTERVAL 7 DAY)), 
    ('E.10', (SELECT id FROM users ORDER BY RAND() LIMIT 1), 'Incorrect profile settings', '2025-01-21', DATE_ADD('2025-01-21', INTERVAL 7 DAY));


-- Procedure to assign employees to unresolved errors based on error code

CREATE PROCEDURE assign_employee_to_error()
BEGIN
    UPDATE errors e
    JOIN employees emp ON e.error_code = emp.handled_errors
    SET e.employee_id = emp.employee_number
    WHERE e.employee_id IS NULL;
END;


CALL assign_employee_to_error();


-- Create a table to store content details 

CREATE TABLE content (
    show_id VARCHAR(50),
    title TEXT,
    type ENUM('movie', 'series'),
    director TEXT,
    genre VARCHAR(100),
    production_year YEAR,
    duration VARCHAR(100)
);


-- Insert sample content data into the table

INSERT INTO content (title, type, director, genre, production_year, duration)
VALUES
    ('The Shawshank Redemption', 'movie', 'Frank Darabont', 'Drama', 1994, '142 minutes'),
    ('Breaking Bad', 'series', 'Vince Gilligan', 'Crime', 2008, '5 seasons'),
    ('The Dark Knight', 'movie', 'Christopher Nolan', 'Action', 2008, '152 minutes'),
    ('Stranger Things', 'series', 'The Duffer Brothers', 'Sci-Fi', 2016, '4 seasons'),
    ('Inception', 'movie', 'Christopher Nolan', 'Sci-Fi', 2010, '148 minutes'),
    ('The Witcher', 'series', 'Lauren Schmidt Hissrich', 'Fantasy', 2019, '2 seasons'),
    ('Fight Club', 'movie', 'David Fincher', 'Drama', 1999, '139 minutes'),
    ('Chernobyl', 'series', 'Craig Mazin', 'Historical', 2019, '1 season'),
    ('Forrest Gump', 'movie', 'Robert Zemeckis', 'Drama', 1994, '142 minutes'),
    ('The Office', 'series', 'Greg Daniels', 'Comedy', 2005, '9 seasons'),
    ('Interstellar', 'movie', 'Christopher Nolan', 'Sci-Fi', 2014, '169 minutes'),
    ('The Mandalorian', 'series', 'Jon Favreau', 'Sci-Fi', 2019, '3 seasons'),
    ('The Godfather', 'movie', 'Francis Ford Coppola', 'Crime', 1972, '175 minutes'),
    ('Peaky Blinders', 'series', 'Steven Knight', 'Drama', 2013, '6 seasons'),
    ('Pulp Fiction', 'movie', 'Quentin Tarantino', 'Crime', 1994, '154 minutes'),
    ('Friends', 'series', 'David Crane', 'Comedy', 1994, '10 seasons'),
    ('The Matrix', 'movie', 'The Wachowskis', 'Sci-Fi', 1999, '136 minutes'),
    ('Game of Thrones', 'series', 'David Benioff', 'Fantasy', 2011, '8 seasons'),
    ('The Lion King', 'movie', 'Jon Favreau', 'Animation', 2019, '118 minutes'),
    ('Sherlock', 'series', 'Mark Gatiss', 'Crime', 2010, '4 seasons'),
    ('Gladiator', 'movie', 'Ridley Scott', 'Drama', 2000, '155 minutes'),
    ('Narcos', 'series', 'Andrés Baiz', 'Crime', 2015, '3 seasons'),
    ('The Godfather Part II', 'movie', 'Francis Ford Coppola', 'Crime', 1974, '202 minutes'),
    ('Black Mirror', 'series', 'Charlie Brooker', 'Sci-Fi', 2011, '5 seasons'),
    ('The Dark Knight Rises', 'movie', 'Christopher Nolan', 'Action', 2012, '164 minutes'),
    ('Money Heist', 'series', 'Álex Pina', 'Crime', 2017, '5 seasons'),
    ('The Prestige', 'movie', 'Christopher Nolan', 'Drama', 2006, '130 minutes'),
    ('Westworld', 'series', 'Jonathan Nolan', 'Sci-Fi', 2016, '4 seasons'),
    ('Se7en', 'movie', 'David Fincher', 'Crime', 1995, '127 minutes'),
    ('The Simpsons', 'series', 'Matt Groening', 'Comedy', 1989, '34 seasons'),
    ('Avatar', 'movie', 'James Cameron', 'Sci-Fi', 2009, '162 minutes'),
    ('The Sopranos', 'series', 'David Chase', 'Crime', 1999, '6 seasons'),
    ('The Revenant', 'movie', 'Alejandro González Iñárritu', 'Drama', 2015, '156 minutes'),
    ('Vikings', 'series', 'Michael Hirst', 'Historical', 2013, '6 seasons'),
    ('A Beautiful Mind', 'movie', 'Ron Howard', 'Drama', 2001, '135 minutes'),
    ('Stranger Things 2', 'series', 'The Duffer Brothers', 'Sci-Fi', 2017, '4 seasons'),
    ('The Social Network', 'movie', 'David Fincher', 'Drama', 2010, '120 minutes'),
    ('House of Cards', 'series', 'Beau Willimon', 'Drama', 2013, '6 seasons'),
    ('The Truman Show', 'movie', 'Peter Weir', 'Drama', 1998, '103 minutes'),
    ('The Big Bang Theory', 'series', 'Chuck Lorre', 'Comedy', 2007, '12 seasons'),
    ('The Terminator', 'movie', 'James Cameron', 'Sci-Fi', 1984, '107 minutes'),
    ('Narcos: Mexico', 'series', 'Carlo Bernard', 'Crime', 2018, '3 seasons'),
    ('The Great Gatsby', 'movie', 'Baz Luhrmann', 'Drama', 2013, '143 minutes'),
    ('Fargo', 'series', 'Noah Hawley', 'Crime', 2014, '5 seasons'),
    ('Shutter Island', 'movie', 'Martin Scorsese', 'Thriller', 2010, '138 minutes'),
    ('Better Call Saul', 'series', 'Vince Gilligan', 'Crime', 2015, '6 seasons'),
    ('Inglourious Basterds', 'movie', 'Quentin Tarantino', 'War', 2009, '153 minutes'),
    ('Dark', 'series', 'Baran bo Odar', 'Sci-Fi', 2017, '3 seasons'),
    ('Doctor Who', 'series', 'Sydney Newman', 'Sci-Fi', 1963, '13 seasons'),
    ('Schindler’s List', 'movie', 'Steven Spielberg', 'Drama', 1993, '195 minutes'),
    ('Mad Men', 'series', 'Matthew Weiner', 'Drama', 2007, '7 seasons'),
    ('The Big Lebowski', 'movie', 'Joel Coen', 'Comedy', 1998, '117 minutes'),
    ('Bojack Horseman', 'series', 'Raphael Bob-Waksberg', 'Animation', 2014, '6 seasons'),
    ('The Bourne Identity', 'movie', 'Doug Liman', 'Action', 2002, '119 minutes'),
    ('The Handmaid’s Tale', 'series', 'Bruce Miller', 'Drama', 2017, '5 seasons'),
    ('Mad Max: Fury Road', 'movie', 'George Miller', 'Action', 2015, '120 minutes'),
    ('The Crown', 'series', 'Peter Morgan', 'Drama', 2016, '6 seasons'),
    ('The Hunger Games', 'movie', 'Gary Ross', 'Sci-Fi', 2012, '142 minutes'),
    ('The Expanse', 'series', 'Mark Fergus', 'Sci-Fi', 2015, '6 seasons'),
    ('Guardians of the Galaxy', 'movie', 'James Gunn', 'Action', 2014, '121 minutes'),
    ('Fleabag', 'series', 'Phoebe Waller-Bridge', 'Comedy', 2016, '2 seasons'),
    ('Star Wars: A New Hope', 'movie', 'George Lucas', 'Sci-Fi', 1977, '121 minutes'),
    ('The Witcher', 'series', 'Lauren Schmidt Hissrich', 'Fantasy', 2019, '2 seasons'),
    ('The Avengers', 'movie', 'Joss Whedon', 'Action', 2012, '143 minutes'),
    ('True Detective', 'series', 'Nic Pizzolatto', 'Crime', 2014, '3 seasons'),
    ('The Shining', 'movie', 'Stanley Kubrick', 'Horror', 1980, '146 minutes'),
    ('Black Panther', 'movie', 'Ryan Coogler', 'Action', 2018, '134 minutes'),
    ('The Godfather III', 'movie', 'Francis Ford Coppola', 'Crime', 1990, '162 minutes'),
    ('The Good Place', 'series', 'Michael Schur', 'Comedy', 2016, '4 seasons'),
    ('The Matrix Reloaded', 'movie', 'The Wachowskis', 'Sci-Fi', 2003, '138 minutes'),
    ('Hannibal', 'series', 'Bryan Fuller', 'Crime', 2013, '3 seasons'),
    ('12 Angry Men', 'movie', 'Sidney Lumet', 'Drama', 1957, '96 minutes'),
    ('Rick and Morty', 'series', 'Dan Harmon', 'Animation', 2013, '6 seasons'),
    ('The Hunger Games: Catching Fire', 'movie', 'Francis Lawrence', 'Sci-Fi', 2013, '146 minutes'),
    ('Killing Eve', 'series', 'Phoebe Waller-Bridge', 'Crime', 2018, '4 seasons'),
    ('The Lion King 2', 'movie', 'Bradley Raymond', 'Animation', 1998, '81 minutes'),
    ('Breaking Bad: El Camino', 'movie', 'Vince Gilligan', 'Crime', 2019, '122 minutes'),
    ('Joker', 'movie', 'Todd Phillips', 'Drama', 2019, '122 minutes'),
    ('The Good, The Bad and The Ugly', 'movie', 'Sergio Leone', 'Western', 1966, '161 minutes'),
    ('The Walking Dead', 'series', 'Frank Darabont', 'Horror', 2010, '11 seasons'),
    ('Inside Out', 'movie', 'Pete Docter', 'Animation', 2015, '95 minutes'),
    ('The Flash', 'series', 'Greg Berlanti', 'Sci-Fi', 2014, '9 seasons'),
    ('Dune', 'movie', 'Denis Villeneuve', 'Sci-Fi', 2021, '155 minutes'),
    ('Arcane', 'series', 'Christian Linke', 'Fantasy', 2021, '1 season'),
    ('Soul', 'movie', 'Pete Docter', 'Animation', 2020, '100 minutes'),
    ('The Boys', 'series', 'Eric Kripke', 'Action', 2019, '4 seasons'),
    ('Avengers: Endgame', 'movie', 'Anthony Russo', 'Action', 2019, '181 minutes'),
    ('The Umbrella Academy', 'series', 'Steve Blackman', 'Fantasy', 2019, '3 seasons'),
    ('Parasite', 'movie', 'Bong Joon-ho', 'Drama', 2019, '132 minutes'),
    ('Loki', 'series', 'Michael Waldron', 'Fantasy', 2021, '2 seasons'),
    ('Everything Everywhere All at Once', 'movie', 'Daniel Kwan', 'Sci-Fi', 2022, '139 minutes'),
    ('The Pianist', 'movie', 'Roman Polanski', 'Biographical', 2002, '150 minutes'),
    ('Spirited Away', 'movie', 'Hayao Miyazaki', 'Animation', 2001, '125 minutes'),
    ('Andor', 'series', 'Tony Gilroy', 'Sci-Fi', 2022, '1 season'),
    ('No Country for Old Men', 'movie', 'Ethan Coen', 'Thriller', 2007, '122 minutes'),
    ('Foundation', 'series', 'David S. Goyer', 'Sci-Fi', 2021, '2 seasons'),
    ('The Crown', 'series', 'Peter Morgan', 'Historical', 2016, '6 seasons'),
    ('The Irishman', 'movie', 'Martin Scorsese', 'Crime', 2019, '209 minutes'),
    ('Wednesday', 'series', 'Alfred Gough', 'Fantasy', 2022, '1 season'),
    ('Moana', 'movie', 'Ron Clements', 'Animation', 2016, '107 minutes');


-- Create a procedure to assign unique show IDs to content

CREATE PROCEDURE assign_show_id()
BEGIN
    SET @row_number = 0;
    UPDATE content
    SET show_id = CONCAT('T', (@row_number := @row_number + 1));
END;


CALL assign_show_id();


-- Alter the table to set the show_id as the primary key

ALTER TABLE content
ADD PRIMARY KEY (show_id);


-- Create a table to store information about content watched by users

CREATE TABLE watched (
    user_id INT NOT NULL,
    content_id VARCHAR(100) NOT NULL,
    genre VARCHAR(100),
    finished ENUM('Yes', 'No'),
    rating DECIMAL(3,1),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (content_id) REFERENCES content(show_id)
);


-- Create a table to store average user ratings and counts for different genres

CREATE TABLE user_movies (
    user_id INT,
    action INT,
    rating1 DECIMAL(3,1),
    drama INT,
    rating2 DECIMAL(3,1),
    comedy INT,
    rating3 DECIMAL(3,1),
    animation INT,
    rating4 DECIMAL(3,1),
    sci_fi INT,
    rating5 DECIMAL(3,1),
    crime INT,
    rating6 DECIMAL(3,1),
    fantasy INT,
    rating7 DECIMAL(3,1),
    historical INT,
    rating8 DECIMAL(3,1),
    thriller INT,
    rating9 DECIMAL(3,1),
    war INT,
    rating10 DECIMAL(3,1),
    horror INT,
    rating11 DECIMAL(3,1),
    western INT,
    rating12 DECIMAL(3,1),
    biographical INT,
    rating13 DECIMAL(3,1),
    FOREIGN KEY (user_id) REFERENCES users(id)
);


-- Insert user IDs into the user_movies table
INSERT INTO user_movies (user_id)
SELECT id FROM users;


-- Create a trigger that updates the user_movies table after a user watches a content item

CREATE TRIGGER user_watched
AFTER INSERT ON watched
FOR EACH ROW
BEGIN
    IF NEW.genre = 'Action' AND NEW.finished = 'Yes' THEN
        UPDATE user_movies
        SET action = IFNULL(action, 0) + 1
        WHERE user_id = NEW.user_id;
        UPDATE user_movies
        SET rating1 = CASE
            WHEN rating1 IS NULL THEN NEW.rating
            ELSE (rating1 * (action - 1) + NEW.rating) / action
        END
        WHERE user_id = NEW.user_id;
    END IF;

    IF NEW.genre = 'Drama' AND NEW.finished = 'Yes' THEN
        UPDATE user_movies
        SET drama = IFNULL(drama, 0) + 1
        WHERE user_id = NEW.user_id;
        UPDATE user_movies
        SET rating2 = CASE
            WHEN rating2 IS NULL THEN NEW.rating
            ELSE (rating2 * (drama - 1) + NEW.rating) / drama
        END
        WHERE user_id = NEW.user_id;
    END IF;

    IF NEW.genre = 'Comedy' AND NEW.finished = 'Yes' THEN
        UPDATE user_movies
        SET comedy = IFNULL(comedy, 0) + 1
        WHERE user_id = NEW.user_id;
        UPDATE user_movies
        SET rating3 = CASE
            WHEN rating3 IS NULL THEN NEW.rating
            ELSE (rating3 * (comedy - 1) + NEW.rating) / comedy
        END
        WHERE user_id = NEW.user_id;
    END IF;

    IF NEW.genre = 'Animation' AND NEW.finished = 'Yes' THEN
        UPDATE user_movies
        SET animation = IFNULL(animation, 0) + 1
        WHERE user_id = NEW.user_id;
        UPDATE user_movies
        SET rating4 = CASE
            WHEN rating4 IS NULL THEN NEW.rating
            ELSE (rating4 * (animation - 1) + NEW.rating) / animation
        END
        WHERE user_id = NEW.user_id;
    END IF;

    IF NEW.genre = 'Sci-Fi' AND NEW.finished = 'Yes' THEN
        UPDATE user_movies
        SET sci_fi = IFNULL(sci_fi, 0) + 1
        WHERE user_id = NEW.user_id;
        UPDATE user_movies
        SET rating5 = CASE
            WHEN rating5 IS NULL THEN NEW.rating
            ELSE (rating5 * (sci_fi - 1) + NEW.rating) / sci_fi
        END
        WHERE user_id = NEW.user_id;
    END IF;

    IF NEW.genre = 'Crime' AND NEW.finished = 'Yes' THEN
        UPDATE user_movies
        SET crime = IFNULL(crime, 0) + 1
        WHERE user_id = NEW.user_id;
        UPDATE user_movies
        SET rating6 = CASE
            WHEN rating6 IS NULL THEN NEW.rating
            ELSE (rating6 * (crime - 1) + NEW.rating) / crime
        END
        WHERE user_id = NEW.user_id;
    END IF;

    IF NEW.genre = 'Fantasy' AND NEW.finished = 'Yes' THEN
        UPDATE user_movies
        SET fantasy = IFNULL(fantasy, 0) + 1
        WHERE user_id = NEW.user_id;
        UPDATE user_movies
        SET rating7 = CASE
            WHEN rating7 IS NULL THEN NEW.rating
            ELSE (rating7 * (fantasy - 1) + NEW.rating) / fantasy
        END
        WHERE user_id = NEW.user_id;
    END IF;

    IF NEW.genre = 'Historical' AND NEW.finished = 'Yes' THEN
        UPDATE user_movies
        SET historical = IFNULL(historical, 0) + 1
        WHERE user_id = NEW.user_id;
        UPDATE user_movies
        SET rating8 = CASE
            WHEN rating8 IS NULL THEN NEW.rating
            ELSE (rating8 * (historical - 1) + NEW.rating) / historical
        END
        WHERE user_id = NEW.user_id;
    END IF;

    IF NEW.genre = 'Thriller' AND NEW.finished = 'Yes' THEN
        UPDATE user_movies
        SET thriller = IFNULL(thriller, 0) + 1
        WHERE user_id = NEW.user_id;
        UPDATE user_movies
        SET rating9 = CASE
            WHEN rating9 IS NULL THEN NEW.rating
            ELSE (rating9 * (thriller - 1) + NEW.rating) / thriller
        END
        WHERE user_id = NEW.user_id;
    END IF;

    IF NEW.genre = 'War' AND NEW.finished = 'Yes' THEN
        UPDATE user_movies
        SET war = IFNULL(war, 0) + 1
        WHERE user_id = NEW.user_id;
        UPDATE user_movies
        SET rating10 = CASE
            WHEN rating10 IS NULL THEN NEW.rating
            ELSE (rating10 * (war - 1) + NEW.rating) / war
        END
        WHERE user_id = NEW.user_id;
    END IF;

    IF NEW.genre = 'Horror' AND NEW.finished = 'Yes' THEN
        UPDATE user_movies
        SET horror = IFNULL(horror, 0) + 1
        WHERE user_id = NEW.user_id;
        UPDATE user_movies
        SET rating11 = CASE
            WHEN rating11 IS NULL THEN NEW.rating
            ELSE (rating11 * (horror - 1) + NEW.rating) / horror
        END
        WHERE user_id = NEW.user_id;
    END IF;

    IF NEW.genre = 'Western' AND NEW.finished = 'Yes' THEN
        UPDATE user_movies
        SET western = IFNULL(western, 0) + 1
        WHERE user_id = NEW.user_id;
        UPDATE user_movies
        SET rating12 = CASE
            WHEN rating12 IS NULL THEN NEW.rating
            ELSE (rating12 * (western - 1) + NEW.rating) / western
        END
        WHERE user_id = NEW.user_id;
    END IF;

    IF NEW.genre = 'Biographical' AND NEW.finished = 'Yes' THEN
        UPDATE user_movies
        SET biographical = IFNULL(biographical, 0) + 1
        WHERE user_id = NEW.user_id;
        UPDATE user_movies
        SET rating13 = CASE
            WHEN rating13 IS NULL THEN NEW.rating
            ELSE (rating13 * (biographical - 1) + NEW.rating) / biographical
        END
        WHERE user_id = NEW.user_id;
    END IF;
END;


-- Create a table to store statistics about users activity and ratings

CREATE TABLE IF NOT EXISTS user_statistics (
    user_id INT PRIMARY KEY,
    number_of_ratings INT DEFAULT 0,
    average_rating DECIMAL(3,2) DEFAULT 0.00,
    number_of_watched INT DEFAULT 0,
    last_genre VARCHAR(100),
    FOREIGN KEY (user_id) REFERENCES users(id)
);


-- Insert user statistics for each user from the users table

INSERT INTO user_statistics (user_id)
SELECT id FROM users;


-- Trigger to update user statistics after inserting a record into the watched table

CREATE TRIGGER update_user_statistics
AFTER INSERT ON watched
FOR EACH ROW
BEGIN
    IF EXISTS (SELECT 1 FROM user_statistics WHERE user_id = NEW.user_id) THEN
        UPDATE user_statistics
        SET
            number_of_watched = number_of_watched + 1,
            last_genre = NEW.genre,
            number_of_ratings = number_of_ratings + IF(NEW.rating IS NOT NULL, 1, 0),
            average_rating = CASE
                WHEN NEW.rating IS NOT NULL THEN
                    (average_rating * number_of_ratings + NEW.rating) / (number_of_ratings + 1)
                ELSE average_rating
            END
        WHERE user_id = NEW.user_id;
    ELSE
        INSERT INTO user_statistics (user_id, number_of_watched, last_genre, number_of_ratings, average_rating)
        VALUES (
            NEW.user_id,
            1,
            NEW.genre,
            IF(NEW.rating IS NOT NULL, 1, 0),
            IF(NEW.rating IS NOT NULL, NEW.rating, 0.00)
        );
    END IF;
END;


-- Insert 100 randomly generated records into the watched table

INSERT INTO watched (user_id, content_id, genre, finished, rating)
SELECT
    FLOOR(1 + RAND() * 100) AS user_id,
    t.show_id AS content_id,
    t.genre,
    CASE
        WHEN RAND() < 0.9 THEN 'Yes'
        ELSE 'No'
    END AS finished,
    ROUND(1.0 + (RAND() * 9.0), 1) AS rating
FROM content t
ORDER BY RAND()
LIMIT 100;


SELECT * FROM watched;

SELECT * FROM user_movies;


-- Create a table to store advertisement details

CREATE TABLE ads (
    company VARCHAR(255) NOT NULL,
    amount DECIMAL(10,2),
    impressions_count INT,
    ad_type ENUM('banner', 'video', 'pop-up', 'text') NOT NULL,
    ad_duration INT,
    start_date DATETIME,
    end_date DATETIME,
    status ENUM('Active', 'Expired', 'Suspended') DEFAULT 'Active'
);


-- Insert sample advertisement data into the ads table

INSERT INTO ads (company, amount, impressions_count, ad_type, ad_duration, start_date, end_date, status)
VALUES
    ('Coca Cola', 5500.00, 45000, 'banner', NULL, '2025-01-01 00:00:00', '2025-02-01 23:59:59', 'Active'),
    ('Nike', 4200.00, 60000, 'video', FLOOR(20 + (RAND() * 40)), '2025-01-05 00:00:00', '2025-02-05 23:59:59', 'Active'),
    ('Pepsi', 3800.00, 70000, 'pop-up', NULL, '2025-01-10 00:00:00', '2025-02-10 23:59:59', 'Expired'),
    ('Apple', 3500.00, 100000, 'video', FLOOR(20 + (RAND() * 40)), '2025-01-15 00:00:00', '2025-02-15 23:59:59', 'Active'),
    ('Samsung', 4500.00, 80000, 'banner', NULL, '2025-01-20 00:00:00', '2025-02-20 23:59:59', 'Suspended'),
    ('Sony', 4000.00, 90000, 'pop-up', NULL, '2025-01-25 00:00:00', '2025-02-25 23:59:59', 'Active'),
    ('Amazon', 2700.00, 110000, 'text', NULL, '2025-01-30 00:00:00', '2025-02-28 23:59:59', 'Active'),
    ('Microsoft', 5000.00, 120000, 'video', FLOOR(20 + (RAND() * 40)), '2025-02-01 00:00:00', '2025-03-01 23:59:59', 'Active'),
    ('Tesla', 3000.00, 50000, 'banner', NULL, '2025-02-05 00:00:00', '2025-03-05 23:59:59', 'Expired'),
    ('Intel', 5500.00, 150000, 'video', FLOOR(20 + (RAND() * 40)), '2025-02-10 00:00:00', '2025-03-10 23:59:59', 'Suspended'),
    ('Honda', 5800.00, 60000, 'pop-up', NULL, '2025-02-15 00:00:00', '2025-03-15 23:59:59', 'Active'),
    ('Toyota', 4300.00, 80000, 'banner', NULL, '2025-02-20 00:00:00', '2025-03-20 23:59:59', 'Active'),
    ('Nike', 4000.00, 90000, 'text', NULL, '2025-02-25 00:00:00', '2025-03-25 23:59:59', 'Active'),
    ('Pepsi', 2700.00, 70000, 'video', FLOOR(20 + (RAND() * 40)), '2025-03-01 00:00:00', '2025-04-01 23:59:59', 'Active'),
    ('Samsung', 3200.00, 60000, 'pop-up', NULL, '2025-03-05 00:00:00', '2025-04-05 23:59:59', 'Active'),
    ('Apple', 5500.00, 75000, 'banner', NULL, '2025-03-10 00:00:00', '2025-04-10 23:59:59', 'Suspended'),
    ('Amazon', 2900.00, 85000, 'video', FLOOR(20 + (RAND() * 40)), '2025-03-15 00:00:00', '2025-04-15 23:59:59', 'Active'),
    ('Intel', 5100.00, 100000, 'text', NULL, '2025-03-20 00:00:00', '2025-04-20 23:59:59', 'Active'),
    ('Tesla', 2600.00, 65000, 'pop-up', NULL, '2025-03-25 00:00:00', '2025-04-25 23:59:59', 'Active'),
    ('Sony', 5000.00, 55000, 'video', FLOOR(20 + (RAND() * 40)), '2025-04-01 00:00:00', '2025-05-01 23:59:59', 'Expired'),
    ('Honda', 4200.00, 95000, 'banner', NULL, '2025-04-05 00:00:00', '2025-05-05 23:59:59', 'Active'),
    ('Toyota', 6600.00, 80000, 'text', NULL, '2025-04-10 00:00:00', '2025-05-10 23:59:59', 'Active'),
    ('Nike', 3300.00, 70000, 'video', FLOOR(20 + (RAND() * 40)), '2025-04-15 00:00:00', '2025-05-15 23:59:59', 'Suspended'),
    ('Pepsi', 3100.00, 120000, 'pop-up', NULL, '2025-04-20 00:00:00', '2025-05-20 23:59:59', 'Active'),
    ('Samsung', 6400.00, 85000, 'banner', NULL, '2025-04-25 00:00:00', '2025-05-25 23:59:59', 'Active'),
    ('Apple', 4000.00, 95000, 'video', FLOOR(20 + (RAND() * 40)), '2025-05-01 00:00:00', '2025-06-01 23:59:59', 'Active'),
    ('Amazon', 2700.00, 100000, 'text', NULL, '2025-05-05 00:00:00', '2025-06-05 23:59:59', 'Expired'),
    ('Intel', 4500.00, 75000, 'pop-up', NULL, '2025-05-10 00:00:00', '2025-06-10 23:59:59', 'Active'),
    ('Tesla', 6800.00, 95000, 'video', FLOOR(20 + (RAND() * 40)), '2025-05-15 00:00:00', '2025-06-15 23:59:59', 'Active');


-- Creating a table to archive inactive users

CREATE TABLE archive_users (
    id INT,
    first_name VARCHAR(100),
    last_name VARCHAR(200),
    email VARCHAR(200),
    account_status ENUM('inactive', 'active')
);


-- Creating an event to automatically archive inactive users every month

CREATE OR REPLACE EVENT archive_inactive_users
    ON SCHEDULE EVERY 1 MONTH
    DO
    BEGIN
        INSERT INTO archive_users (id, first_name, last_name, email, account_status)
        SELECT id, first_name, last_name, email, account_status
        FROM users
        WHERE account_status = 'inactive';
        DELETE FROM users WHERE account_status = 'inactive';
    END;


SELECT * FROM archive_users;

-- Creating an event to automatically assign the standard "demo" plan to users with a "pending" status every 7 days

CREATE EVENT assign_standard_plan
    ON SCHEDULE EVERY 7 DAY
    DO
    BEGIN
        UPDATE subscription_plan
        SET plan = 'demo', status = 'active'
        WHERE status = 'pending';
    END;


-- Creating an event to deactivate expired subscriptions every day

CREATE EVENT remove_inactive_subscriptions
    ON SCHEDULE EVERY 1 DAY
    DO
    BEGIN
        UPDATE subscription_plan
        SET status = 'inactive'
        WHERE end_date < CURDATE() AND status = 'active';
    END;


-- Creating a view for active ads

CREATE VIEW active_ads_view AS
    SELECT
        company,
        ad_type,
        impressions_count,
        ad_duration,
        start_date,
        end_date,
        status
    FROM ads
    WHERE status = 'Active';


SELECT * FROM user_movies;

SELECT * FROM subscription_plan;


-- Creating a view to display active users along with their subscription details

CREATE VIEW active_users_view AS
SELECT
    u.id,
    u.first_name,
    u.last_name,
    ps.plan,
    ps.price,
    ps.start_date,
    ps.end_date
FROM
    users u
JOIN
    subscription_plan ps ON u.id = ps.id
WHERE
    u.account_status = 'active' AND ps.status = 'active';


-- Creating a view to calculate net profit based on ad revenue, subscription revenue, and employee expenses

CREATE VIEW net_profit_view AS
SELECT
    IFNULL(SUM(r.amount), 0) AS ad_revenue,
    IFNULL(SUM(ps.price), 0) AS subscription_revenue,
    IFNULL(SUM(p.salary), 0) AS employee_expenses,
    (IFNULL(SUM(r.amount), 0) + IFNULL(SUM(ps.price), 0) - IFNULL(SUM(p.salary), 0)) AS net_profit
FROM
    (SELECT SUM(amount) AS amount FROM ads WHERE status = 'Active') r,
    (SELECT SUM(price) AS price FROM subscription_plan WHERE status = 'active') ps,
    (SELECT SUM(salary) AS salary FROM employees) p;


SELECT * FROM net_profit_view;


-- Creating a function to calculate net profit by summing ad revenue and subscription revenue, then subtracting employee expenses

CREATE FUNCTION calculate_net_profit()
RETURNS DECIMAL(15, 2)
DETERMINISTIC
BEGIN
    DECLARE ad_revenue DECIMAL(15, 2);
    DECLARE subscription_revenue DECIMAL(15, 2);
    DECLARE employee_expenses DECIMAL(15, 2);
    DECLARE net_profit DECIMAL(15, 2);

    SELECT IFNULL(SUM(amount), 0) INTO ad_revenue FROM ads;
    SELECT IFNULL(SUM(price), 0) INTO subscription_revenue FROM subscription_plan WHERE status = 'active';
    SELECT IFNULL(SUM(salary), 0) INTO employee_expenses FROM employees;

    SET net_profit = (ad_revenue + subscription_revenue) - employee_expenses;
    RETURN net_profit;
END;


SELECT calculate_net_profit();


-- Creating a function to determine the most popular genre based on the highest number of watched records

CREATE OR REPLACE FUNCTION most_popular_genre()
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE result VARCHAR(100);

    SELECT genre
    INTO result
    FROM watched
    GROUP BY genre
    ORDER BY COUNT(*) DESC
    LIMIT 1;

    RETURN result;
END;


SELECT most_popular_genre();


-- Creating a function to recommend a movie based on the user's highest-rated genre and ensuring they haven't watched it yet

CREATE OR REPLACE FUNCTION recommend_movie(user_id INT)
RETURNS TEXT
DETERMINISTIC
BEGIN
    DECLARE recommended_movie TEXT;
    DECLARE best_genre VARCHAR(100);

    SELECT genre INTO best_genre
    FROM (
        SELECT 'Action' AS genre, AVG(COALESCE(rating1, 0)) AS average_rating FROM user_movies WHERE user_movies.user_id = user_id
        UNION ALL
        SELECT 'Drama', AVG(COALESCE(rating2, 0)) FROM user_movies WHERE user_movies.user_id = user_id
        UNION ALL
        SELECT 'Comedy', AVG(COALESCE(rating3, 0)) FROM user_movies WHERE user_movies.user_id = user_id
        UNION ALL
        SELECT 'Animation', AVG(COALESCE(rating4, 0)) FROM user_movies WHERE user_movies.user_id = user_id
        UNION ALL
        SELECT 'Sci-Fi', AVG(COALESCE(rating5, 0)) FROM user_movies WHERE user_movies.user_id = user_id
        UNION ALL
        SELECT 'Crime', AVG(COALESCE(rating6, 0)) FROM user_movies WHERE user_movies.user_id = user_id
        UNION ALL
        SELECT 'Fantasy', AVG(COALESCE(rating7, 0)) FROM user_movies WHERE user_movies.user_id = user_id
        UNION ALL
        SELECT 'Historical', AVG(COALESCE(rating8, 0)) FROM user_movies WHERE user_movies.user_id = user_id
        UNION ALL
        SELECT 'Thriller', AVG(COALESCE(rating9, 0)) FROM user_movies WHERE user_movies.user_id = user_id
        UNION ALL
        SELECT 'War', AVG(COALESCE(rating10, 0)) FROM user_movies WHERE user_movies.user_id = user_id
        UNION ALL
        SELECT 'Horror', AVG(COALESCE(rating11, 0)) FROM user_movies WHERE user_movies.user_id = user_id
        UNION ALL
        SELECT 'Western', AVG(COALESCE(rating12, 0)) FROM user_movies WHERE user_movies.user_id = user_id
        UNION ALL
        SELECT 'Biographical', AVG(COALESCE(rating13, 0)) FROM user_movies WHERE user_movies.user_id = user_id
    ) AS genre_ratings
    WHERE average_rating IS NOT NULL
    ORDER BY average_rating DESC
    LIMIT 1;

    SELECT t.title INTO recommended_movie
    FROM content t
    WHERE t.genre = best_genre
    AND t.show_id NOT IN (
        SELECT o.content_id FROM watched o WHERE o.user_id = user_id
    )
    ORDER BY RAND()
    LIMIT 1;

    RETURN COALESCE(recommended_movie, 'No available recommendations for the user.');
END;


SELECT recommend_movie(29) AS recommendation;

-- Creating an index on the email column in the users table to optimize email-based queries

CREATE INDEX idx_email ON users(email);
SELECT * FROM users WHERE email = 'michal.nowak@pekus.com';


-- Creating an index on the employee_number column in the employees table to speed up employee searches

CREATE INDEX idx_employee_number ON employees(employee_number);
SELECT * FROM employees WHERE employee_number = 'E10';


-- Creating an index on the account_status column in the users table to improve queries filtering by account status

CREATE INDEX idx_account_status ON users(account_status);
SELECT * FROM users WHERE account_status = 'inactive';