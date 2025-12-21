USE [master]
GO
/****** Object:  Database [SchoolDB_Labb2]    Script Date: 2025-12-21 17:28:29 ******/
CREATE DATABASE [SchoolDB_Labb2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SchoolDB_Labb2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\SchoolDB_Labb2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SchoolDB_Labb2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\SchoolDB_Labb2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SchoolDB_Labb2] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SchoolDB_Labb2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SchoolDB_Labb2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SchoolDB_Labb2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SchoolDB_Labb2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SchoolDB_Labb2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SchoolDB_Labb2] SET ARITHABORT OFF 
GO
ALTER DATABASE [SchoolDB_Labb2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SchoolDB_Labb2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SchoolDB_Labb2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SchoolDB_Labb2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SchoolDB_Labb2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SchoolDB_Labb2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SchoolDB_Labb2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SchoolDB_Labb2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SchoolDB_Labb2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SchoolDB_Labb2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SchoolDB_Labb2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SchoolDB_Labb2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SchoolDB_Labb2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SchoolDB_Labb2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SchoolDB_Labb2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SchoolDB_Labb2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SchoolDB_Labb2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SchoolDB_Labb2] SET RECOVERY FULL 
GO
ALTER DATABASE [SchoolDB_Labb2] SET  MULTI_USER 
GO
ALTER DATABASE [SchoolDB_Labb2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SchoolDB_Labb2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SchoolDB_Labb2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SchoolDB_Labb2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SchoolDB_Labb2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SchoolDB_Labb2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SchoolDB_Labb2', N'ON'
GO
ALTER DATABASE [SchoolDB_Labb2] SET QUERY_STORE = ON
GO
ALTER DATABASE [SchoolDB_Labb2] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SchoolDB_Labb2]
GO
/****** Object:  Table [dbo].[Classes]    Script Date: 2025-12-21 17:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classes](
	[Id] [int] IDENTITY(1000,1) NOT NULL,
	[ClassName] [nvarchar](50) NOT NULL,
	[TeacherId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 2025-12-21 17:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CourseName] [nvarchar](50) NOT NULL,
	[TeacherId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GradeInfo]    Script Date: 2025-12-21 17:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GradeInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GradeName] [nvarchar](8) NOT NULL,
	[GradeValue] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grades]    Script Date: 2025-12-21 17:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grades](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[TeacherId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[Grade] [int] NOT NULL,
	[DateAssigned] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Junction_CourseAssignment]    Script Date: 2025-12-21 17:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Junction_CourseAssignment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Personel]    Script Date: 2025-12-21 17:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personel](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[VocationId] [int] NOT NULL,
	[PhoneNumber] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 2025-12-21 17:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[ClassId] [int] NULL,
	[PhoneNumber] [nvarchar](50) NOT NULL,
	[ParentPhoneNumber] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vocations]    Script Date: 2025-12-21 17:28:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vocations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Classes] ON 

INSERT [dbo].[Classes] ([Id], [ClassName], [TeacherId]) VALUES (1000, N'NA2023', 3)
INSERT [dbo].[Classes] ([Id], [ClassName], [TeacherId]) VALUES (1001, N'NA2024', 10)
INSERT [dbo].[Classes] ([Id], [ClassName], [TeacherId]) VALUES (1002, N'NA2025', 7)
SET IDENTITY_INSERT [dbo].[Classes] OFF
GO
SET IDENTITY_INSERT [dbo].[Courses] ON 

INSERT [dbo].[Courses] ([Id], [CourseName], [TeacherId]) VALUES (1, N'Math_A_2023', 4)
INSERT [dbo].[Courses] ([Id], [CourseName], [TeacherId]) VALUES (2, N'Math_B_2024', 5)
INSERT [dbo].[Courses] ([Id], [CourseName], [TeacherId]) VALUES (3, N'Math_C_2025', 5)
INSERT [dbo].[Courses] ([Id], [CourseName], [TeacherId]) VALUES (4, N'English_A_2023', 2)
INSERT [dbo].[Courses] ([Id], [CourseName], [TeacherId]) VALUES (5, N'Programming_A_2023', 3)
INSERT [dbo].[Courses] ([Id], [CourseName], [TeacherId]) VALUES (6, N'Physics_A_2024', 6)
INSERT [dbo].[Courses] ([Id], [CourseName], [TeacherId]) VALUES (7, N'Physics_B_2025', 10)
INSERT [dbo].[Courses] ([Id], [CourseName], [TeacherId]) VALUES (8, N'Math_A_2024', 4)
INSERT [dbo].[Courses] ([Id], [CourseName], [TeacherId]) VALUES (9, N'Math_B_2025', 5)
INSERT [dbo].[Courses] ([Id], [CourseName], [TeacherId]) VALUES (10, N'English_A_2024', 2)
INSERT [dbo].[Courses] ([Id], [CourseName], [TeacherId]) VALUES (11, N'Programming_A_2024', 3)
INSERT [dbo].[Courses] ([Id], [CourseName], [TeacherId]) VALUES (12, N'Physics_A_2025', 10)
INSERT [dbo].[Courses] ([Id], [CourseName], [TeacherId]) VALUES (13, N'Math_A_2025', 4)
INSERT [dbo].[Courses] ([Id], [CourseName], [TeacherId]) VALUES (14, N'Programming_A_2025', 3)
INSERT [dbo].[Courses] ([Id], [CourseName], [TeacherId]) VALUES (15, N'English_A_2025', 2)
SET IDENTITY_INSERT [dbo].[Courses] OFF
GO
SET IDENTITY_INSERT [dbo].[GradeInfo] ON 

INSERT [dbo].[GradeInfo] ([Id], [GradeName], [GradeValue]) VALUES (1, N'MVG', 20)
INSERT [dbo].[GradeInfo] ([Id], [GradeName], [GradeValue]) VALUES (2, N'VG', 15)
INSERT [dbo].[GradeInfo] ([Id], [GradeName], [GradeValue]) VALUES (3, N'G', 10)
INSERT [dbo].[GradeInfo] ([Id], [GradeName], [GradeValue]) VALUES (4, N'IG', 0)
SET IDENTITY_INSERT [dbo].[GradeInfo] OFF
GO
SET IDENTITY_INSERT [dbo].[Grades] ON 

INSERT [dbo].[Grades] ([Id], [StudentId], [TeacherId], [CourseId], [Grade], [DateAssigned]) VALUES (1, 2, 4, 1, 3, CAST(N'2023-10-16' AS Date))
INSERT [dbo].[Grades] ([Id], [StudentId], [TeacherId], [CourseId], [Grade], [DateAssigned]) VALUES (2, 2, 5, 2, 3, CAST(N'2024-10-16' AS Date))
INSERT [dbo].[Grades] ([Id], [StudentId], [TeacherId], [CourseId], [Grade], [DateAssigned]) VALUES (3, 2, 5, 3, 3, CAST(N'2025-10-16' AS Date))
INSERT [dbo].[Grades] ([Id], [StudentId], [TeacherId], [CourseId], [Grade], [DateAssigned]) VALUES (4, 2, 2, 4, 1, CAST(N'2023-12-21' AS Date))
INSERT [dbo].[Grades] ([Id], [StudentId], [TeacherId], [CourseId], [Grade], [DateAssigned]) VALUES (5, 2, 3, 5, 3, CAST(N'2024-02-28' AS Date))
INSERT [dbo].[Grades] ([Id], [StudentId], [TeacherId], [CourseId], [Grade], [DateAssigned]) VALUES (6, 2, 6, 6, 2, CAST(N'2025-05-30' AS Date))
INSERT [dbo].[Grades] ([Id], [StudentId], [TeacherId], [CourseId], [Grade], [DateAssigned]) VALUES (7, 2, 10, 7, 1, CAST(N'2026-05-30' AS Date))
INSERT [dbo].[Grades] ([Id], [StudentId], [TeacherId], [CourseId], [Grade], [DateAssigned]) VALUES (8, 3, 4, 1, 2, CAST(N'2023-10-16' AS Date))
INSERT [dbo].[Grades] ([Id], [StudentId], [TeacherId], [CourseId], [Grade], [DateAssigned]) VALUES (9, 3, 5, 2, 3, CAST(N'2024-10-16' AS Date))
INSERT [dbo].[Grades] ([Id], [StudentId], [TeacherId], [CourseId], [Grade], [DateAssigned]) VALUES (10, 3, 5, 3, 2, CAST(N'2025-10-16' AS Date))
INSERT [dbo].[Grades] ([Id], [StudentId], [TeacherId], [CourseId], [Grade], [DateAssigned]) VALUES (11, 3, 2, 4, 2, CAST(N'2023-12-21' AS Date))
INSERT [dbo].[Grades] ([Id], [StudentId], [TeacherId], [CourseId], [Grade], [DateAssigned]) VALUES (12, 3, 3, 5, 3, CAST(N'2024-02-28' AS Date))
INSERT [dbo].[Grades] ([Id], [StudentId], [TeacherId], [CourseId], [Grade], [DateAssigned]) VALUES (13, 3, 6, 6, 1, CAST(N'2025-05-30' AS Date))
INSERT [dbo].[Grades] ([Id], [StudentId], [TeacherId], [CourseId], [Grade], [DateAssigned]) VALUES (14, 3, 10, 7, 2, CAST(N'2026-05-30' AS Date))
INSERT [dbo].[Grades] ([Id], [StudentId], [TeacherId], [CourseId], [Grade], [DateAssigned]) VALUES (15, 1, 4, 1, 2, CAST(N'2023-10-16' AS Date))
INSERT [dbo].[Grades] ([Id], [StudentId], [TeacherId], [CourseId], [Grade], [DateAssigned]) VALUES (16, 1, 5, 2, 3, CAST(N'2024-10-16' AS Date))
INSERT [dbo].[Grades] ([Id], [StudentId], [TeacherId], [CourseId], [Grade], [DateAssigned]) VALUES (17, 1, 5, 3, 4, CAST(N'2025-10-16' AS Date))
INSERT [dbo].[Grades] ([Id], [StudentId], [TeacherId], [CourseId], [Grade], [DateAssigned]) VALUES (18, 1, 2, 4, 3, CAST(N'2024-01-14' AS Date))
INSERT [dbo].[Grades] ([Id], [StudentId], [TeacherId], [CourseId], [Grade], [DateAssigned]) VALUES (19, 1, 3, 5, 1, CAST(N'2024-02-28' AS Date))
INSERT [dbo].[Grades] ([Id], [StudentId], [TeacherId], [CourseId], [Grade], [DateAssigned]) VALUES (20, 1, 6, 6, 2, CAST(N'2025-05-30' AS Date))
INSERT [dbo].[Grades] ([Id], [StudentId], [TeacherId], [CourseId], [Grade], [DateAssigned]) VALUES (21, 1, 10, 7, 3, CAST(N'2026-05-30' AS Date))
INSERT [dbo].[Grades] ([Id], [StudentId], [TeacherId], [CourseId], [Grade], [DateAssigned]) VALUES (22, 4, 4, 8, 1, CAST(N'2024-10-16' AS Date))
INSERT [dbo].[Grades] ([Id], [StudentId], [TeacherId], [CourseId], [Grade], [DateAssigned]) VALUES (23, 4, 5, 9, 3, CAST(N'2025-10-16' AS Date))
INSERT [dbo].[Grades] ([Id], [StudentId], [TeacherId], [CourseId], [Grade], [DateAssigned]) VALUES (24, 4, 2, 10, 1, CAST(N'2024-12-19' AS Date))
INSERT [dbo].[Grades] ([Id], [StudentId], [TeacherId], [CourseId], [Grade], [DateAssigned]) VALUES (25, 4, 3, 11, 3, CAST(N'2025-02-28' AS Date))
INSERT [dbo].[Grades] ([Id], [StudentId], [TeacherId], [CourseId], [Grade], [DateAssigned]) VALUES (26, 4, 10, 12, 4, CAST(N'2025-05-29' AS Date))
INSERT [dbo].[Grades] ([Id], [StudentId], [TeacherId], [CourseId], [Grade], [DateAssigned]) VALUES (27, 6, 4, 8, 2, CAST(N'2024-10-16' AS Date))
INSERT [dbo].[Grades] ([Id], [StudentId], [TeacherId], [CourseId], [Grade], [DateAssigned]) VALUES (28, 6, 5, 9, 2, CAST(N'2025-10-16' AS Date))
INSERT [dbo].[Grades] ([Id], [StudentId], [TeacherId], [CourseId], [Grade], [DateAssigned]) VALUES (29, 6, 2, 10, 2, CAST(N'2024-12-19' AS Date))
INSERT [dbo].[Grades] ([Id], [StudentId], [TeacherId], [CourseId], [Grade], [DateAssigned]) VALUES (30, 6, 3, 11, 3, CAST(N'2025-02-28' AS Date))
INSERT [dbo].[Grades] ([Id], [StudentId], [TeacherId], [CourseId], [Grade], [DateAssigned]) VALUES (31, 6, 10, 12, 3, CAST(N'2025-05-29' AS Date))
INSERT [dbo].[Grades] ([Id], [StudentId], [TeacherId], [CourseId], [Grade], [DateAssigned]) VALUES (32, 5, 4, 8, 1, CAST(N'2024-10-16' AS Date))
INSERT [dbo].[Grades] ([Id], [StudentId], [TeacherId], [CourseId], [Grade], [DateAssigned]) VALUES (33, 5, 5, 9, 1, CAST(N'2025-10-16' AS Date))
INSERT [dbo].[Grades] ([Id], [StudentId], [TeacherId], [CourseId], [Grade], [DateAssigned]) VALUES (34, 5, 2, 10, 2, CAST(N'2024-12-19' AS Date))
INSERT [dbo].[Grades] ([Id], [StudentId], [TeacherId], [CourseId], [Grade], [DateAssigned]) VALUES (35, 5, 3, 11, 2, CAST(N'2025-02-28' AS Date))
INSERT [dbo].[Grades] ([Id], [StudentId], [TeacherId], [CourseId], [Grade], [DateAssigned]) VALUES (36, 5, 10, 12, 2, CAST(N'2025-05-29' AS Date))
INSERT [dbo].[Grades] ([Id], [StudentId], [TeacherId], [CourseId], [Grade], [DateAssigned]) VALUES (37, 7, 4, 13, 1, CAST(N'2025-10-16' AS Date))
INSERT [dbo].[Grades] ([Id], [StudentId], [TeacherId], [CourseId], [Grade], [DateAssigned]) VALUES (38, 7, 3, 14, 1, CAST(N'2026-02-28' AS Date))
INSERT [dbo].[Grades] ([Id], [StudentId], [TeacherId], [CourseId], [Grade], [DateAssigned]) VALUES (39, 7, 2, 15, 1, CAST(N'2025-12-20' AS Date))
INSERT [dbo].[Grades] ([Id], [StudentId], [TeacherId], [CourseId], [Grade], [DateAssigned]) VALUES (40, 8, 4, 13, 3, CAST(N'2025-12-05' AS Date))
INSERT [dbo].[Grades] ([Id], [StudentId], [TeacherId], [CourseId], [Grade], [DateAssigned]) VALUES (41, 8, 3, 14, 3, CAST(N'2026-02-28' AS Date))
INSERT [dbo].[Grades] ([Id], [StudentId], [TeacherId], [CourseId], [Grade], [DateAssigned]) VALUES (42, 8, 2, 15, 2, CAST(N'2025-12-20' AS Date))
INSERT [dbo].[Grades] ([Id], [StudentId], [TeacherId], [CourseId], [Grade], [DateAssigned]) VALUES (43, 9, 4, 13, 1, CAST(N'2025-10-16' AS Date))
INSERT [dbo].[Grades] ([Id], [StudentId], [TeacherId], [CourseId], [Grade], [DateAssigned]) VALUES (44, 9, 3, 14, 2, CAST(N'2026-02-28' AS Date))
INSERT [dbo].[Grades] ([Id], [StudentId], [TeacherId], [CourseId], [Grade], [DateAssigned]) VALUES (45, 9, 2, 15, 3, CAST(N'2025-12-20' AS Date))
SET IDENTITY_INSERT [dbo].[Grades] OFF
GO
SET IDENTITY_INSERT [dbo].[Junction_CourseAssignment] ON 

INSERT [dbo].[Junction_CourseAssignment] ([Id], [StudentId], [CourseId]) VALUES (1, 1, 1)
INSERT [dbo].[Junction_CourseAssignment] ([Id], [StudentId], [CourseId]) VALUES (2, 1, 2)
INSERT [dbo].[Junction_CourseAssignment] ([Id], [StudentId], [CourseId]) VALUES (3, 1, 3)
INSERT [dbo].[Junction_CourseAssignment] ([Id], [StudentId], [CourseId]) VALUES (4, 1, 4)
INSERT [dbo].[Junction_CourseAssignment] ([Id], [StudentId], [CourseId]) VALUES (5, 1, 5)
INSERT [dbo].[Junction_CourseAssignment] ([Id], [StudentId], [CourseId]) VALUES (6, 1, 6)
INSERT [dbo].[Junction_CourseAssignment] ([Id], [StudentId], [CourseId]) VALUES (7, 1, 7)
INSERT [dbo].[Junction_CourseAssignment] ([Id], [StudentId], [CourseId]) VALUES (8, 2, 1)
INSERT [dbo].[Junction_CourseAssignment] ([Id], [StudentId], [CourseId]) VALUES (9, 2, 2)
INSERT [dbo].[Junction_CourseAssignment] ([Id], [StudentId], [CourseId]) VALUES (10, 2, 3)
INSERT [dbo].[Junction_CourseAssignment] ([Id], [StudentId], [CourseId]) VALUES (11, 2, 4)
INSERT [dbo].[Junction_CourseAssignment] ([Id], [StudentId], [CourseId]) VALUES (12, 2, 5)
INSERT [dbo].[Junction_CourseAssignment] ([Id], [StudentId], [CourseId]) VALUES (13, 2, 6)
INSERT [dbo].[Junction_CourseAssignment] ([Id], [StudentId], [CourseId]) VALUES (14, 2, 7)
INSERT [dbo].[Junction_CourseAssignment] ([Id], [StudentId], [CourseId]) VALUES (15, 3, 1)
INSERT [dbo].[Junction_CourseAssignment] ([Id], [StudentId], [CourseId]) VALUES (16, 3, 2)
INSERT [dbo].[Junction_CourseAssignment] ([Id], [StudentId], [CourseId]) VALUES (17, 3, 3)
INSERT [dbo].[Junction_CourseAssignment] ([Id], [StudentId], [CourseId]) VALUES (18, 3, 4)
INSERT [dbo].[Junction_CourseAssignment] ([Id], [StudentId], [CourseId]) VALUES (19, 3, 5)
INSERT [dbo].[Junction_CourseAssignment] ([Id], [StudentId], [CourseId]) VALUES (20, 3, 6)
INSERT [dbo].[Junction_CourseAssignment] ([Id], [StudentId], [CourseId]) VALUES (21, 3, 7)
INSERT [dbo].[Junction_CourseAssignment] ([Id], [StudentId], [CourseId]) VALUES (22, 4, 8)
INSERT [dbo].[Junction_CourseAssignment] ([Id], [StudentId], [CourseId]) VALUES (23, 4, 9)
INSERT [dbo].[Junction_CourseAssignment] ([Id], [StudentId], [CourseId]) VALUES (24, 4, 10)
INSERT [dbo].[Junction_CourseAssignment] ([Id], [StudentId], [CourseId]) VALUES (25, 4, 11)
INSERT [dbo].[Junction_CourseAssignment] ([Id], [StudentId], [CourseId]) VALUES (26, 4, 12)
INSERT [dbo].[Junction_CourseAssignment] ([Id], [StudentId], [CourseId]) VALUES (27, 5, 8)
INSERT [dbo].[Junction_CourseAssignment] ([Id], [StudentId], [CourseId]) VALUES (28, 5, 9)
INSERT [dbo].[Junction_CourseAssignment] ([Id], [StudentId], [CourseId]) VALUES (29, 5, 10)
INSERT [dbo].[Junction_CourseAssignment] ([Id], [StudentId], [CourseId]) VALUES (30, 5, 11)
INSERT [dbo].[Junction_CourseAssignment] ([Id], [StudentId], [CourseId]) VALUES (31, 5, 12)
INSERT [dbo].[Junction_CourseAssignment] ([Id], [StudentId], [CourseId]) VALUES (32, 6, 8)
INSERT [dbo].[Junction_CourseAssignment] ([Id], [StudentId], [CourseId]) VALUES (33, 6, 9)
INSERT [dbo].[Junction_CourseAssignment] ([Id], [StudentId], [CourseId]) VALUES (34, 6, 10)
INSERT [dbo].[Junction_CourseAssignment] ([Id], [StudentId], [CourseId]) VALUES (35, 6, 11)
INSERT [dbo].[Junction_CourseAssignment] ([Id], [StudentId], [CourseId]) VALUES (36, 6, 12)
INSERT [dbo].[Junction_CourseAssignment] ([Id], [StudentId], [CourseId]) VALUES (37, 7, 13)
INSERT [dbo].[Junction_CourseAssignment] ([Id], [StudentId], [CourseId]) VALUES (38, 7, 14)
INSERT [dbo].[Junction_CourseAssignment] ([Id], [StudentId], [CourseId]) VALUES (39, 7, 15)
INSERT [dbo].[Junction_CourseAssignment] ([Id], [StudentId], [CourseId]) VALUES (40, 8, 13)
INSERT [dbo].[Junction_CourseAssignment] ([Id], [StudentId], [CourseId]) VALUES (41, 8, 14)
INSERT [dbo].[Junction_CourseAssignment] ([Id], [StudentId], [CourseId]) VALUES (42, 8, 15)
INSERT [dbo].[Junction_CourseAssignment] ([Id], [StudentId], [CourseId]) VALUES (43, 9, 13)
INSERT [dbo].[Junction_CourseAssignment] ([Id], [StudentId], [CourseId]) VALUES (44, 9, 14)
INSERT [dbo].[Junction_CourseAssignment] ([Id], [StudentId], [CourseId]) VALUES (45, 9, 15)
SET IDENTITY_INSERT [dbo].[Junction_CourseAssignment] OFF
GO
SET IDENTITY_INSERT [dbo].[Personel] ON 

INSERT [dbo].[Personel] ([Id], [FirstName], [LastName], [VocationId], [PhoneNumber]) VALUES (1, N'Vilja', N'Harkoonen', 2, N'+46 70 512 84 39')
INSERT [dbo].[Personel] ([Id], [FirstName], [LastName], [VocationId], [PhoneNumber]) VALUES (2, N'Harward', N'Cooper', 1, N'+46 73 948 22 10')
INSERT [dbo].[Personel] ([Id], [FirstName], [LastName], [VocationId], [PhoneNumber]) VALUES (3, N'Yorick', N'Hamlet', 1, N'+46 76 331 57 42')
INSERT [dbo].[Personel] ([Id], [FirstName], [LastName], [VocationId], [PhoneNumber]) VALUES (4, N'Fiona', N'Smith', 1, N'+46 72 904 66 18')
INSERT [dbo].[Personel] ([Id], [FirstName], [LastName], [VocationId], [PhoneNumber]) VALUES (5, N'John', N'Doe', 1, N'+46 79 655 41 07')
INSERT [dbo].[Personel] ([Id], [FirstName], [LastName], [VocationId], [PhoneNumber]) VALUES (6, N'Jane', N'Deer', 3, N'+46 60 842 13 75')
INSERT [dbo].[Personel] ([Id], [FirstName], [LastName], [VocationId], [PhoneNumber]) VALUES (7, N'Joanna', N'Fawn', 1, N'+46 31 728 55 42')
INSERT [dbo].[Personel] ([Id], [FirstName], [LastName], [VocationId], [PhoneNumber]) VALUES (8, N'Greg', N'Flynn', 5, N'+46 40 912 48 06')
INSERT [dbo].[Personel] ([Id], [FirstName], [LastName], [VocationId], [PhoneNumber]) VALUES (9, N'Laurence', N'Burns', 4, N'+46 90 774 21 58')
INSERT [dbo].[Personel] ([Id], [FirstName], [LastName], [VocationId], [PhoneNumber]) VALUES (10, N'Clemént', N'Garnier', 1, N'+46 46 882 34 91')
INSERT [dbo].[Personel] ([Id], [FirstName], [LastName], [VocationId], [PhoneNumber]) VALUES (11, N'Erik', N'Jonsson', 5, N'+4648509236')
SET IDENTITY_INSERT [dbo].[Personel] OFF
GO
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [ClassId], [PhoneNumber], [ParentPhoneNumber]) VALUES (1, N'Oliver', N'Johnson', 1000, N'+46 70 512 84 39', N'+46 70 900 11 22')
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [ClassId], [PhoneNumber], [ParentPhoneNumber]) VALUES (2, N'Alexander', N'Gonzalez', 1000, N'+46 76 433 59 18', N'+46 76 499 10 88')
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [ClassId], [PhoneNumber], [ParentPhoneNumber]) VALUES (3, N'Sophia', N'Brown', 1000, N'+46 72 904 66 18', N'+46 72 933 12 19')
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [ClassId], [PhoneNumber], [ParentPhoneNumber]) VALUES (4, N'Victoria', N'Ramirez', 1001, N'+46 46 611 48 72', N'+46 46 655 91 44')
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [ClassId], [PhoneNumber], [ParentPhoneNumber]) VALUES (5, N'Henry', N'Miller', 1001, N'+46 31 728 55 42', N'+46 31 712 12 44')
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [ClassId], [PhoneNumber], [ParentPhoneNumber]) VALUES (6, N'Ella', N'Perez', 1001, N'+46 76 882 45 90', N'+46 76 811 30 01')
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [ClassId], [PhoneNumber], [ParentPhoneNumber]) VALUES (7, N'Samuel', N'Harris', 1002, N'+46 31 488 22 73', N'+46 31 400 91 55')
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [ClassId], [PhoneNumber], [ParentPhoneNumber]) VALUES (8, N'Isabella', N'Martinez', 1002, N'+46 46 882 34 91', N'+46 46 899 21 78')
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [ClassId], [PhoneNumber], [ParentPhoneNumber]) VALUES (9, N'Daniel', N'Jackson', 1002, N'+46 46 700 12 58', N'+46 46 766 22 31')
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [ClassId], [PhoneNumber], [ParentPhoneNumber]) VALUES (10, N'Bluh', N'Bleh', 1001, N'4578klk3', N'2146476km')
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [ClassId], [PhoneNumber], [ParentPhoneNumber]) VALUES (12, N'Guh', N'Gah', 1002, N'sdfh565645', N'2357656856')
SET IDENTITY_INSERT [dbo].[Students] OFF
GO
SET IDENTITY_INSERT [dbo].[Vocations] ON 

INSERT [dbo].[Vocations] ([Id], [Title]) VALUES (1, N'Teacher')
INSERT [dbo].[Vocations] ([Id], [Title]) VALUES (2, N'Principal')
INSERT [dbo].[Vocations] ([Id], [Title]) VALUES (3, N'Janitor')
INSERT [dbo].[Vocations] ([Id], [Title]) VALUES (4, N'Receptionist')
INSERT [dbo].[Vocations] ([Id], [Title]) VALUES (5, N'Nurse')
SET IDENTITY_INSERT [dbo].[Vocations] OFF
GO
ALTER TABLE [dbo].[Classes]  WITH CHECK ADD  CONSTRAINT [FK_Personel_Classes] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Personel] ([Id])
GO
ALTER TABLE [dbo].[Classes] CHECK CONSTRAINT [FK_Personel_Classes]
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_Personel_Courses] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Personel] ([Id])
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_Personel_Courses]
GO
ALTER TABLE [dbo].[Grades]  WITH CHECK ADD  CONSTRAINT [FK_Courses_Grades] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([Id])
GO
ALTER TABLE [dbo].[Grades] CHECK CONSTRAINT [FK_Courses_Grades]
GO
ALTER TABLE [dbo].[Grades]  WITH CHECK ADD  CONSTRAINT [FK_GradeInfo_Grades] FOREIGN KEY([Grade])
REFERENCES [dbo].[GradeInfo] ([Id])
GO
ALTER TABLE [dbo].[Grades] CHECK CONSTRAINT [FK_GradeInfo_Grades]
GO
ALTER TABLE [dbo].[Grades]  WITH CHECK ADD  CONSTRAINT [FK_Personel_Grades] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Personel] ([Id])
GO
ALTER TABLE [dbo].[Grades] CHECK CONSTRAINT [FK_Personel_Grades]
GO
ALTER TABLE [dbo].[Grades]  WITH CHECK ADD  CONSTRAINT [FK_Students_Grades] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Students] ([Id])
GO
ALTER TABLE [dbo].[Grades] CHECK CONSTRAINT [FK_Students_Grades]
GO
ALTER TABLE [dbo].[Junction_CourseAssignment]  WITH CHECK ADD  CONSTRAINT [FK_Courses_CourseAssignment] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([Id])
GO
ALTER TABLE [dbo].[Junction_CourseAssignment] CHECK CONSTRAINT [FK_Courses_CourseAssignment]
GO
ALTER TABLE [dbo].[Junction_CourseAssignment]  WITH CHECK ADD  CONSTRAINT [FK_Students_CourseAssignment] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Students] ([Id])
GO
ALTER TABLE [dbo].[Junction_CourseAssignment] CHECK CONSTRAINT [FK_Students_CourseAssignment]
GO
ALTER TABLE [dbo].[Personel]  WITH CHECK ADD  CONSTRAINT [FK_Vocations_Personel] FOREIGN KEY([VocationId])
REFERENCES [dbo].[Vocations] ([Id])
GO
ALTER TABLE [dbo].[Personel] CHECK CONSTRAINT [FK_Vocations_Personel]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Classes_Students] FOREIGN KEY([ClassId])
REFERENCES [dbo].[Classes] ([Id])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Classes_Students]
GO
USE [master]
GO
ALTER DATABASE [SchoolDB_Labb2] SET  READ_WRITE 
GO
