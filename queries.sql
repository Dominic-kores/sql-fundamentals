
-- ============================================
-- TASK 1: SQL FUNDAMENTALS
-- 10 Basic SQL Queries
-- ============================================

-- Query 1: Find all students from Nairobi.
SELECT *
FROM students
WHERE town = 'Nairobi';


-- Query 2: Find courses with more than 3 credits.
-- Sort alphabetically by course name.
SELECT *
FROM courses
WHERE credits > 3
ORDER BY name ASC;


-- Query 3: Display student names and enrolled courses.
-- JOIN links students, enrollments and courses.
SELECT
    s.name AS student_name,
    c.name AS course_name
FROM students s
JOIN enrollments e ON s.id = e.student_id
JOIN courses c ON e.course_id = c.id
ORDER BY s.id, e.id;


-- Query 4: Count students enrolled in each course.
-- GROUP BY combines enrollment records per course.
SELECT
    c.name AS course_name,
    COUNT(e.student_id) AS student_count
FROM courses c
JOIN enrollments e ON c.id = e.course_id
GROUP BY c.id, c.name
ORDER BY student_count DESC, c.id;


-- Query 5: Find students older than 22.
-- Display the oldest students first.
SELECT name, age, town
FROM students
WHERE age > 22
ORDER BY age DESC, id;


-- Query 6: Calculate the average enrollment grade.
SELECT
    AVG(grade) AS avg_grade
FROM enrollments;


-- Query 7: Find highest and lowest grades.
SELECT
    MAX(grade) AS highest_grade,
    MIN(grade) AS lowest_grade
FROM enrollments;


-- Query 8: Find students whose names start
-- with a vowel (A, E, I, O, U).
-- ~* performs case-insensitive regex matching.
SELECT name
FROM students
WHERE name ~* '^[aeiou]'
ORDER BY name;


-- Query 9: Find courses taught by teachers
-- in the Computer Science department.
SELECT
    c.name AS course_name,
    t.name AS teacher_name
FROM courses c
JOIN teachers t ON c.teacher_id = t.id
WHERE t.department = 'Computer Science'
ORDER BY c.id;


-- Query 10: Find towns with more than one student.
-- HAVING filters grouped records.
SELECT
    town,
    COUNT(*) AS student_count
FROM students
GROUP BY town
HAVING COUNT(*) > 1
ORDER BY student_count DESC, town;




-- ============================================
-- TASK 2: BUSINESS QUESTIONS
-- ============================================

-- QUESTION 1:
-- Which teacher has the most unique students?
-- DISTINCT prevents duplicate student counting.
SELECT
    t.name AS teacher_name,
    COUNT(DISTINCT e.student_id) AS total_students
FROM teachers t
JOIN courses c ON t.id = c.teacher_id
JOIN enrollments e ON c.id = e.course_id
GROUP BY t.id, t.name
ORDER BY total_students DESC, t.id
LIMIT 1;


-- QUESTION 2:
-- Find the average grade for each course.
-- ROUND formats the average to two decimal places.
SELECT
    c.name AS course_name,
    ROUND(AVG(e.grade), 2) AS avg_grade
FROM courses c
JOIN enrollments e ON c.id = e.course_id
GROUP BY c.id, c.name
ORDER BY avg_grade DESC, c.id;


-- QUESTION 3:
-- Find students enrolled in more than 3 courses.
-- HAVING filters grouped enrollment counts.
SELECT
    s.name AS student_name,
    COUNT(e.course_id) AS course_count
FROM students s
JOIN enrollments e ON s.id = e.student_id
GROUP BY s.id, s.name
HAVING COUNT(e.course_id) > 3
ORDER BY s.id;



-- ============================================
-- TASK 3: DATA MODIFICATIONS
-- ============================================

-- TASK 3A: INSERT FIVE NEW STUDENTS
-- PostgreSQL automatically generates each student's ID.
INSERT INTO students (name, email, age, town)
VALUES
('Njeri Maina', 'njeri@student.ac.ke', 20, 'Nyeri'),
('Kamau Githuku', 'kamau.g@student.ac.ke', 22, 'Kiambu'),
('Atieno Owino', 'atieno@student.ac.ke', 21, 'Homa Bay'),
('Baraka Mwiti', 'baraka@student.ac.ke', 23, 'Meru'),
('Zawadi Chebet', 'zawadi@student.ac.ke', 19, 'Kericho');

-- Verify the five added students.
SELECT name, email, town
FROM students
WHERE id > 10
ORDER BY id;


-- TASK 3B: UPDATE GRADES
-- Increase grades by 5 for course_id 1.
-- LEAST prevents any grade exceeding 100.
UPDATE enrollments
SET grade = LEAST(grade + 5, 100)
WHERE course_id = 1;

-- Verify updated grades.
SELECT
    s.name,
    e.grade
FROM enrollments e
JOIN students s ON e.student_id = s.id
WHERE e.course_id = 1
ORDER BY s.name;


-- TASK 3C: DELETE STUDENTS WITHOUT ENROLLMENTS
-- Delete students who do not appear in enrollments.
DELETE FROM students s
WHERE NOT EXISTS (
    SELECT 1
    FROM enrollments e
    WHERE e.student_id = s.id
);

-- Verify remaining students.
SELECT
    COUNT(*) AS remaining_students
FROM students;



-- ============================================
-- FINAL ASSIGNMENT VERIFICATION
-- ============================================

-- Verify remaining students.
SELECT COUNT(*) AS total_students FROM students;

-- Verify teachers.
SELECT COUNT(*) AS total_teachers FROM teachers;

-- Verify courses.
SELECT COUNT(*) AS total_courses FROM courses;

-- Verify enrollments.
SELECT COUNT(*) AS total_enrollments FROM enrollments;

-- Verify grade boundaries.
SELECT COUNT(*) AS invalid_grades
FROM enrollments
WHERE grade < 0 OR grade > 100;

-- View updated Introduction to Programming grades.
SELECT s.name, e.grade
FROM enrollments e
JOIN students s ON e.student_id = s.id
WHERE e.course_id = 1
ORDER BY s.name;
