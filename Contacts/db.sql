
CREATE TABLE [dbo].[Category](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoryContact]    Script Date: 01.12.2022 14:03:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryContact](
	[Category] [uniqueidentifier] NOT NULL,
	[Contact] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_CategoryContact] PRIMARY KEY CLUSTERED 
(
	[Category] ASC,
	[Contact] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 01.12.2022 14:03:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contacts]    Script Date: 01.12.2022 14:03:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contacts](
	[Id] [uniqueidentifier] NOT NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Company] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Contacts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Company] ([Id], [Name]) VALUES (N'f005fc43-8a45-44f9-b70c-822495a72201', N'Abc')
GO
INSERT [dbo].[Company] ([Id], [Name]) VALUES (N'f005fc43-8a45-44f9-b70c-822495a72202', N'Xyz')
GO
INSERT [dbo].[Contacts] ([Id], [FirstName], [Email], [Company]) VALUES (N'2b0d4283-3575-4423-8bbc-4c543690cd0a', N'Tarje', N'terje@getacademy.no', NULL)
GO
INSERT [dbo].[Contacts] ([Id], [FirstName], [Email], [Company]) VALUES (N'f005fc43-8a45-44f9-b70c-822495a72245', N'Knut', N'knut@mail.com', N'f005fc43-8a45-44f9-b70c-822495a72201')
GO
INSERT [dbo].[Contacts] ([Id], [FirstName], [Email], [Company]) VALUES (N'f005fc43-8a45-44f9-b70c-822495a72247', N'Per', N'per@mail.com', N'f005fc43-8a45-44f9-b70c-822495a72202')
GO
INSERT [dbo].[Contacts] ([Id], [FirstName], [Email], [Company]) VALUES (N'f005fc43-8a45-44f9-b70c-822495a72248', N'Ole', N'ole@mail.com', NULL)
GO
USE [master]
GO
ALTER DATABASE [Contacts] SET  READ_WRITE 
GO
