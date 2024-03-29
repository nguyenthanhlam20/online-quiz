USE [master]
GO
/****** Object:  Database [TestingDB]    Script Date: 3/18/2024 1:00:43 AM ******/
CREATE DATABASE [TestingDB]
GO
ALTER DATABASE [TestingDB] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TestingDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TestingDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TestingDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TestingDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TestingDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TestingDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [TestingDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [TestingDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TestingDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TestingDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TestingDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TestingDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TestingDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TestingDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TestingDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TestingDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TestingDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TestingDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TestingDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TestingDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TestingDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TestingDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TestingDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TestingDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TestingDB] SET  MULTI_USER 
GO
ALTER DATABASE [TestingDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TestingDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TestingDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TestingDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TestingDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TestingDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [TestingDB] SET QUERY_STORE = OFF
GO
USE [TestingDB]
GO
/****** Object:  Table [dbo].[Question]    Script Date: 3/18/2024 1:00:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[testId] [int] NULL,
	[question] [nvarchar](max) NULL,
	[answer] [nvarchar](max) NULL,
	[correct_answer] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Test]    Script Date: 3/18/2024 1:00:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Test](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](255) NULL,
	[status] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 3/18/2024 1:00:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[UserRole] [nvarchar](20) NOT NULL,
	[Status] [bit] NULL,
	[RegistrationDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTest]    Script Date: 3/18/2024 1:00:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTest](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[testId] [int] NULL,
	[score] [decimal](5, 2) NULL,
	[created_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Question] ON 

INSERT [dbo].[Question] ([id], [testId], [question], [answer], [correct_answer]) VALUES (1, 1, N'What is the capital of France?', N'Paris', N'Paris')
INSERT [dbo].[Question] ([id], [testId], [question], [answer], [correct_answer]) VALUES (2, 1, N'Who wrote Hamlet?', N'William Shakespeare', N'William Shakespeare')
INSERT [dbo].[Question] ([id], [testId], [question], [answer], [correct_answer]) VALUES (3, 1, N'Question', N'1,1,3', N'3')
INSERT [dbo].[Question] ([id], [testId], [question], [answer], [correct_answer]) VALUES (4, 2, N'Trans 5', N'5,6,7,8', N'8')
INSERT [dbo].[Question] ([id], [testId], [question], [answer], [correct_answer]) VALUES (5, 3, N'1 + 1', N'1,4,55,6,2', N'2')
INSERT [dbo].[Question] ([id], [testId], [question], [answer], [correct_answer]) VALUES (6, 4, N'Hello', N'Hi, How are you, Goodbye', N'Hi')
SET IDENTITY_INSERT [dbo].[Question] OFF
GO
SET IDENTITY_INSERT [dbo].[Test] ON 

INSERT [dbo].[Test] ([id], [title], [status]) VALUES (1, N'English Testing Web', N'Active')
INSERT [dbo].[Test] ([id], [title], [status]) VALUES (2, N'Trans 5 Test', N'Active')
INSERT [dbo].[Test] ([id], [title], [status]) VALUES (3, N'Trans 6 Test', N'Active')
INSERT [dbo].[Test] ([id], [title], [status]) VALUES (4, N'LUK 1', N'Active')
SET IDENTITY_INSERT [dbo].[Test] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [Username], [Password], [Email], [UserRole], [Status], [RegistrationDate]) VALUES (1, N'admin', N'admin', N'admin@example.com', N'Admin', 1, CAST(N'2024-03-09T10:05:01.217' AS DateTime))
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Email], [UserRole], [Status], [RegistrationDate]) VALUES (2, N'user1', N'user', N'user1@example.com', N'User', 1, CAST(N'2024-03-09T10:05:01.217' AS DateTime))
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Email], [UserRole], [Status], [RegistrationDate]) VALUES (3, N'user2', N'user', N'user2@example.com', N'User', 1, CAST(N'2024-03-09T10:05:01.217' AS DateTime))
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Email], [UserRole], [Status], [RegistrationDate]) VALUES (4, N'test', N'test', N'testuser@example.com', N'User', 1, CAST(N'2024-03-09T10:22:22.430' AS DateTime))
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Email], [UserRole], [Status], [RegistrationDate]) VALUES (5, N'test2', N'test2', N'test@mail.com', N'User', 0, CAST(N'2024-03-09T10:50:10.287' AS DateTime))
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[UserTest] ON 

INSERT [dbo].[UserTest] ([id], [userId], [testId], [score], [created_at]) VALUES (1, 1, 1, CAST(85.50 AS Decimal(5, 2)), CAST(N'2024-03-17T23:10:17.660' AS DateTime))
INSERT [dbo].[UserTest] ([id], [userId], [testId], [score], [created_at]) VALUES (2, 2, 2, CAST(0.00 AS Decimal(5, 2)), CAST(N'2024-03-18T00:09:52.720' AS DateTime))
INSERT [dbo].[UserTest] ([id], [userId], [testId], [score], [created_at]) VALUES (3, 2, 1, CAST(75.00 AS Decimal(5, 2)), CAST(N'2024-03-18T00:10:19.160' AS DateTime))
INSERT [dbo].[UserTest] ([id], [userId], [testId], [score], [created_at]) VALUES (4, 2, 2, CAST(0.00 AS Decimal(5, 2)), CAST(N'2024-03-18T00:19:24.677' AS DateTime))
INSERT [dbo].[UserTest] ([id], [userId], [testId], [score], [created_at]) VALUES (5, 2, 2, CAST(0.00 AS Decimal(5, 2)), CAST(N'2024-03-18T00:19:28.227' AS DateTime))
INSERT [dbo].[UserTest] ([id], [userId], [testId], [score], [created_at]) VALUES (6, 2, 2, CAST(0.00 AS Decimal(5, 2)), CAST(N'2024-03-18T00:19:31.780' AS DateTime))
INSERT [dbo].[UserTest] ([id], [userId], [testId], [score], [created_at]) VALUES (7, 2, 2, CAST(25.00 AS Decimal(5, 2)), CAST(N'2024-03-18T00:19:34.613' AS DateTime))
INSERT [dbo].[UserTest] ([id], [userId], [testId], [score], [created_at]) VALUES (8, 2, 2, CAST(25.00 AS Decimal(5, 2)), CAST(N'2024-03-18T00:19:42.713' AS DateTime))
INSERT [dbo].[UserTest] ([id], [userId], [testId], [score], [created_at]) VALUES (9, 2, 2, CAST(100.00 AS Decimal(5, 2)), CAST(N'2024-03-18T00:21:33.977' AS DateTime))
INSERT [dbo].[UserTest] ([id], [userId], [testId], [score], [created_at]) VALUES (10, 2, 2, CAST(100.00 AS Decimal(5, 2)), CAST(N'2024-03-18T00:21:37.187' AS DateTime))
INSERT [dbo].[UserTest] ([id], [userId], [testId], [score], [created_at]) VALUES (11, 2, 1, CAST(66.67 AS Decimal(5, 2)), CAST(N'2024-03-18T00:21:47.707' AS DateTime))
INSERT [dbo].[UserTest] ([id], [userId], [testId], [score], [created_at]) VALUES (12, 2, 1, CAST(66.67 AS Decimal(5, 2)), CAST(N'2024-03-18T00:21:53.657' AS DateTime))
INSERT [dbo].[UserTest] ([id], [userId], [testId], [score], [created_at]) VALUES (13, 2, 1, CAST(100.00 AS Decimal(5, 2)), CAST(N'2024-03-18T00:21:59.027' AS DateTime))
INSERT [dbo].[UserTest] ([id], [userId], [testId], [score], [created_at]) VALUES (14, 1, 4, CAST(100.00 AS Decimal(5, 2)), CAST(N'2024-03-18T00:58:03.533' AS DateTime))
INSERT [dbo].[UserTest] ([id], [userId], [testId], [score], [created_at]) VALUES (15, 3, 3, CAST(0.00 AS Decimal(5, 2)), CAST(N'2024-03-18T00:58:29.930' AS DateTime))
SET IDENTITY_INSERT [dbo].[UserTest] OFF
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD FOREIGN KEY([testId])
REFERENCES [dbo].[Test] ([id])
GO
ALTER TABLE [dbo].[UserTest]  WITH CHECK ADD FOREIGN KEY([testId])
REFERENCES [dbo].[Test] ([id])
GO
USE [master]
GO
ALTER DATABASE [TestingDB] SET  READ_WRITE 
GO
