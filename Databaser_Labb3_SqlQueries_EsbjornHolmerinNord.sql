SELECT Students.FirstName, Students.LastName, Courses.CourseName, GradeInfo.GradeName
FROM Grades
JOIN Students ON Grades.StudentId = Students.Id
JOIN Courses ON Grades.CourseId = Courses.Id
JOIN GradeInfo on Grades.Grade =  GradeInfo.Id
WHERE DateAssigned BETWEEN DATEADD(month, -1, GETDATE()) AND GETDATE();

SELECT  Courses.CourseName,
		AVG(GradeInfo.GradeValue) AS Average,
		MIN(GradeInfo.GradeValue) AS Lowest, 
		MAX(GradeInfo.GradeValue) AS Highest
FROM Grades
JOIN Courses ON Grades.CourseId = Courses.Id
JOIN GradeInfo ON Grades.Grade = GradeInfo.Id
GROUP BY Grades.CourseId, CourseName
