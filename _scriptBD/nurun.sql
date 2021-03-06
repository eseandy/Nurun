USE [nurunbank]
GO
/****** Object:  StoredProcedure [dbo].[sp_insert_tran]    Script Date: 30/01/2017 05:06:54 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_insert_tran] (
	@id_user int,
	@id_client int,
	@amount float,
	@desc_tran varchar(100)
	)
	AS

INSERT INTO n_user_transaction (id_user,id_client,date_tran,amount,desc_tran)
VALUES (@id_user,@id_client,GETDATE(),@amount,@desc_tran)

select @@identity
GO
/****** Object:  StoredProcedure [dbo].[sp_login]    Script Date: 30/01/2017 05:06:54 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  create proc [dbo].[sp_login] (
  @user varchar(50),
  @pass varchar(250)
  )
  as
  SELECT id_user, name_user, rol_user from n_user where name_user = @user and pass_user = @pass
GO
/****** Object:  Table [dbo].[n_client]    Script Date: 30/01/2017 05:06:54 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[n_client](
	[id_client] [int] IDENTITY(1,1) NOT NULL,
	[email_cli] [varchar](100) NULL,
	[name_cli] [varchar](100) NULL,
	[pass_cli] [varchar](250) NULL,
	[cuenta_cli] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[n_user]    Script Date: 30/01/2017 05:06:54 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[n_user](
	[id_user] [int] IDENTITY(1,1) NOT NULL,
	[name_user] [varchar](50) NULL,
	[pass_user] [varchar](max) NULL,
	[date_created] [datetime] NULL,
	[rol_user] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[n_user_transaction]    Script Date: 30/01/2017 05:06:54 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[n_user_transaction](
	[id_trans] [int] IDENTITY(1,1) NOT NULL,
	[id_user] [int] NOT NULL,
	[id_client] [int] NOT NULL,
	[date_tran] [datetime] NULL,
	[amount] [float] NULL,
	[desc_tran] [varchar](100) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[n_client] ON 

GO
INSERT [dbo].[n_client] ([id_client], [email_cli], [name_cli], [pass_cli], [cuenta_cli]) VALUES (1, N'cliente1@mail.com', N'Cliente Uni', N'd93728fb81eba65a4f86fe16a691da5b854d6e7fb5d8c64b7385131bd9741af9', N'0009990011')
GO
INSERT [dbo].[n_client] ([id_client], [email_cli], [name_cli], [pass_cli], [cuenta_cli]) VALUES (2, N'cliente2@mail.com', N'Cliente Dos T', N'd93728fb81eba65a4f86fe16a691da5b854d6e7fb5d8c64b7385131bd9741af9', N'0009990022')
GO
INSERT [dbo].[n_client] ([id_client], [email_cli], [name_cli], [pass_cli], [cuenta_cli]) VALUES (3, N'cliente3@mail.com', N'Cliente Tres R', N'd93728fb81eba65a4f86fe16a691da5b854d6e7fb5d8c64b7385131bd9741af9', N'0009990033')
GO
SET IDENTITY_INSERT [dbo].[n_client] OFF
GO
SET IDENTITY_INSERT [dbo].[n_user] ON 

GO
INSERT [dbo].[n_user] ([id_user], [name_user], [pass_user], [date_created], [rol_user]) VALUES (1, N'ejecutivo1', N'd93728fb81eba65a4f86fe16a691da5b854d6e7fb5d8c64b7385131bd9741af9', CAST(N'2017-01-30 01:20:48.913' AS DateTime), 1)
GO
INSERT [dbo].[n_user] ([id_user], [name_user], [pass_user], [date_created], [rol_user]) VALUES (2, N'cajero1', N'd93728fb81eba65a4f86fe16a691da5b854d6e7fb5d8c64b7385131bd9741af9', CAST(N'2017-01-30 01:21:21.493' AS DateTime), 2)
GO
INSERT [dbo].[n_user] ([id_user], [name_user], [pass_user], [date_created], [rol_user]) VALUES (3, N'cliente1', N'd93728fb81eba65a4f86fe16a691da5b854d6e7fb5d8c64b7385131bd9741af9', CAST(N'2017-01-30 01:21:21.493' AS DateTime), 3)
GO
SET IDENTITY_INSERT [dbo].[n_user] OFF
GO
SET IDENTITY_INSERT [dbo].[n_user_transaction] ON 

GO
INSERT [dbo].[n_user_transaction] ([id_trans], [id_user], [id_client], [date_tran], [amount], [desc_tran]) VALUES (1, 1, 3, CAST(N'2017-01-30 03:10:48.243' AS DateTime), 599, N'Comisión por apertura')
GO
INSERT [dbo].[n_user_transaction] ([id_trans], [id_user], [id_client], [date_tran], [amount], [desc_tran]) VALUES (2, 1, 3, CAST(N'2017-01-30 03:11:00.333' AS DateTime), 59, N'IVA Comisión por apertura')
GO
INSERT [dbo].[n_user_transaction] ([id_trans], [id_user], [id_client], [date_tran], [amount], [desc_tran]) VALUES (3, 1, 3, CAST(N'2017-01-30 03:11:20.393' AS DateTime), 159, N'Cobro de Seguro')
GO
INSERT [dbo].[n_user_transaction] ([id_trans], [id_user], [id_client], [date_tran], [amount], [desc_tran]) VALUES (4, 1, 3, CAST(N'2017-01-30 03:11:59.133' AS DateTime), 1590, N'Cargo de Tarjeta Credito 0900')
GO
INSERT [dbo].[n_user_transaction] ([id_trans], [id_user], [id_client], [date_tran], [amount], [desc_tran]) VALUES (5, 1, 3, CAST(N'2017-01-30 04:32:16.153' AS DateTime), 9, N'Ticketmaster')
GO
INSERT [dbo].[n_user_transaction] ([id_trans], [id_user], [id_client], [date_tran], [amount], [desc_tran]) VALUES (6, 1, 3, CAST(N'2017-01-30 04:32:18.840' AS DateTime), 9, N'Ticketmaster')
GO
INSERT [dbo].[n_user_transaction] ([id_trans], [id_user], [id_client], [date_tran], [amount], [desc_tran]) VALUES (7, 1, 3, CAST(N'2017-01-30 04:32:22.910' AS DateTime), 9, N'Ticketmaster')
GO
INSERT [dbo].[n_user_transaction] ([id_trans], [id_user], [id_client], [date_tran], [amount], [desc_tran]) VALUES (8, 1, 3, CAST(N'2017-01-30 04:32:53.540' AS DateTime), 9, N'Ticketmaster2')
GO
INSERT [dbo].[n_user_transaction] ([id_trans], [id_user], [id_client], [date_tran], [amount], [desc_tran]) VALUES (9, 2, 3, CAST(N'2017-01-30 04:37:38.260' AS DateTime), 45, N'IVA')
GO
SET IDENTITY_INSERT [dbo].[n_user_transaction] OFF
GO
