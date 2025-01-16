# Create the database
CREATE DATABASE school;
USE school;

#  Create the teachers table
CREATE TABLE teachers (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    subject VARCHAR(50),
    experience INT,
    salary DECIMAL(10, 2));
    
    # Insert 8 rows into the teachers table
    
INSERT INTO teachers (id, name, subject, experience, salary) VALUES
(1, 'John Doe', 'Math', 5, 30000),
(2, 'Jane Smith', 'Science', 10, 35000),
(3, 'Mark Johnson', 'English', 2, 25000),
(4, 'Emily Davis', 'History', 8, 27000),
(5, 'Michael Brown', 'Geography', 12, 40000),
(6, 'Sarah Miller', 'Biology', 6, 32000),
(7, 'David Wilson', 'Physics', 15, 45000),
(8, 'Anna Lee', 'Chemistry', 4, 28000);

SELECT* FROM teachers;

# Create a before insert trigger named before_insert_teacher that will raise an error “salary cannot be negative” if the salary inserted to the table is less than zero

DELIMITER $$

CREATE TRIGGER before_insert_teacher
BEFORE INSERT ON teachers
FOR EACH ROW
BEGIN
    IF NEW.salary < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Salary cannot be negative';
    END IF;
END $$

DELIMITER ;

# Create the after insert trigger

DELIMITER $$

CREATE TRIGGER after_insert_teacher
AFTER INSERT ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, timestamp)
    VALUES (NEW.id, 'INSERT', NOW());
END $$

DELIMITER ;

# Create the before delete trigger
DELIMITER $$

CREATE TRIGGER before_delete_teacher
BEFORE DELETE ON teachers
FOR EACH ROW
BEGIN
    IF OLD.experience > 10 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot delete teacher with more than 10 years of experience';
    END IF;
END $$

DELIMITER ;

# Create the after delete trigger

DELIMITER $$

CREATE TRIGGER after_delete_teacher
AFTER DELETE ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, timestamp)
    VALUES (OLD.id, 'DELETE', NOW());
END $$

DELIMITER ;






