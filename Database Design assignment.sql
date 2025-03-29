CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY AUTO_INCREMENT,
    DepartmentName VARCHAR(100) NOT NULL
);

CREATE TABLE Faculty (
    FacultyID INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DepartmentID INT UNSIGNED,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

CREATE TABLE Courses (
    CourseCode VARCHAR(10) PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    FacultyID INT UNSIGNED,
    DepartmentID INT UNSIGNED,
    FOREIGN KEY (FacultyID) REFERENCES Faculty(FacultyID),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

CREATE TABLE Students (
    StudentID INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DateOfBirth DATE,
    Email VARCHAR(100) UNIQUE
);

CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT UNSIGNED,
    CourseCode VARCHAR(10),
    EnrollmentDate DATE,
    Grade VARCHAR(2),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseCode) REFERENCES Courses(CourseCode)
);

INSERT INTO Students (FirstName, LastName, DateOfBirth, Email)
VALUES ('Alice', 'Johnson', '2001-06-15', 'alice@example.com');

INSERT INTO Departments (DepartmentName) VALUES ('Computer Science');
INSERT INTO Faculty (FirstName, LastName, DepartmentID) VALUES ('John', 'Doe', 1);
INSERT INTO Courses (CourseCode, CourseName, FacultyID, DepartmentID) VALUES ('CS101', 'Intro to Programming', 1, 1);
INSERT INTO Enrollments (StudentID, CourseCode, EnrollmentDate, Grade) VALUES (1, 'CS101', '2023-10-26', 'A');
