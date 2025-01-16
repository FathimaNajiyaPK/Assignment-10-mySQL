# Assignment-10-mySQL
# TRIGGERS
# School Database with Teacher Managemen
This project involves creating a school database to manage teacher records. It includes the following key operations:

Create Database: A school database is created for storing teacher information and logs.
Teachers Table: A teachers table stores teacher details such as id, name, subject, experience, and salary.
Teacher Log Table: A teacher_log table logs all teacher-related actions (INSERT, DELETE) along with the timestamp.
Triggers:
Before Insert Trigger: Prevents the insertion of teachers with a negative salary.
After Insert Trigger: Logs every insertion of a teacher into the teacher_log table.
Before Delete Trigger: Prevents deletion of teachers with more than 10 years of experience.
After Delete Trigger: Logs every deletion of a teacher from the teacher_log table.
