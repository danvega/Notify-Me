USE [NotifyMe]
GO

/****** Object:  Table [dbo].[notifications]    Script Date: 10/03/2011 10:11:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[notifications](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[pid] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
	[email] [nvarchar](50) NOT NULL,
	[dateCreated] [date] NOT NULL,
	[exported] [bit] NOT NULL,
 CONSTRAINT [PK_notifications] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


