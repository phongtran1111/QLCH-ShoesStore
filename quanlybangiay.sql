USE [master]
GO
/****** Object:  Database [shoes_store]    Script Date: 10/03/2022 8:10:53 CH ******/
CREATE DATABASE [shoes_store]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'shoes_store', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\shoes_store.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'shoes_store_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\shoes_store_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [shoes_store] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [shoes_store].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [shoes_store] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [shoes_store] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [shoes_store] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [shoes_store] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [shoes_store] SET ARITHABORT OFF 
GO
ALTER DATABASE [shoes_store] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [shoes_store] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [shoes_store] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [shoes_store] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [shoes_store] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [shoes_store] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [shoes_store] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [shoes_store] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [shoes_store] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [shoes_store] SET  DISABLE_BROKER 
GO
ALTER DATABASE [shoes_store] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [shoes_store] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [shoes_store] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [shoes_store] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [shoes_store] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [shoes_store] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [shoes_store] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [shoes_store] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [shoes_store] SET  MULTI_USER 
GO
ALTER DATABASE [shoes_store] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [shoes_store] SET DB_CHAINING OFF 
GO
ALTER DATABASE [shoes_store] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [shoes_store] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [shoes_store] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [shoes_store] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [shoes_store] SET QUERY_STORE = OFF
GO
USE [shoes_store]
GO
/****** Object:  User [tuanha]    Script Date: 10/03/2022 8:10:53 CH ******/
CREATE USER [tuanha] FOR LOGIN [tuanha] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [tuanha]
GO
/****** Object:  Table [dbo].[bills]    Script Date: 10/03/2022 8:10:53 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bills](
	[id] [int] NOT NULL,
	[customer_id] [int] NOT NULL,
	[employee_id] [int] NOT NULL,
	[date] [datetime] NULL,
	[total_amount] [int] NOT NULL,
	[status] [int] NOT NULL,
	[type] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 10/03/2022 8:10:53 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[id] [int] NOT NULL,
	[name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[error_products]    Script Date: 10/03/2022 8:10:53 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[error_products](
	[id] [int] NOT NULL,
	[customer_id] [int] NOT NULL,
	[employee_id] [int] NOT NULL,
	[reason_id] [int] NOT NULL,
	[date] [datetime] NOT NULL,
	[status] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_bills]    Script Date: 10/03/2022 8:10:53 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_bills](
	[id] [int] NOT NULL,
	[bill_id] [int] NOT NULL,
	[product_detail_id] [int] NOT NULL,
	[amount] [int] NOT NULL,
	[total] [varchar](45) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_details]    Script Date: 10/03/2022 8:10:53 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_details](
	[id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[size] [nvarchar](20) NULL,
	[price] [varchar](255) NOT NULL,
	[image] [nvarchar](255) NULL,
	[description] [nvarchar](55) NULL,
	[color_blue_amount] [int] NOT NULL,
	[color_red_amount_copy1] [int] NOT NULL,
	[color_purple_amount_copy2] [int] NOT NULL,
	[color_yellow_amount_copy3] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 10/03/2022 8:10:53 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[id] [int] NOT NULL,
	[categorie_id] [int] NOT NULL,
	[code] [varchar](45) NULL,
	[name] [nvarchar](255) NULL,
	[gender] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reasons]    Script Date: 10/03/2022 8:10:53 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reasons](
	[id] [int] NOT NULL,
	[name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 10/03/2022 8:10:53 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] NOT NULL,
	[password] [varchar](255) NOT NULL,
	[email] [varchar](255) NULL,
	[code] [varchar](255) NULL,
	[role] [int] NOT NULL,
	[name] [nvarchar](45) NOT NULL,
	[gender] [varchar](45) NOT NULL,
	[address] [nvarchar](45) NULL,
	[account_name] [varchar](45) NULL,
	[salary] [varchar](255) NULL,
	[phone] [varchar](12) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[bills] ADD  DEFAULT ((0)) FOR [total_amount]
GO
ALTER TABLE [dbo].[bills] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[bills] ADD  DEFAULT ((0)) FOR [type]
GO
ALTER TABLE [dbo].[product_details] ADD  DEFAULT ((0)) FOR [color_blue_amount]
GO
ALTER TABLE [dbo].[product_details] ADD  DEFAULT ((0)) FOR [color_red_amount_copy1]
GO
ALTER TABLE [dbo].[product_details] ADD  DEFAULT ((0)) FOR [color_purple_amount_copy2]
GO
ALTER TABLE [dbo].[product_details] ADD  DEFAULT ((0)) FOR [color_yellow_amount_copy3]
GO
ALTER TABLE [dbo].[bills]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[bills]  WITH CHECK ADD FOREIGN KEY([employee_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[error_products]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[error_products]  WITH CHECK ADD FOREIGN KEY([employee_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[error_products]  WITH CHECK ADD FOREIGN KEY([reason_id])
REFERENCES [dbo].[reasons] ([id])
GO
ALTER TABLE [dbo].[product_bills]  WITH CHECK ADD FOREIGN KEY([bill_id])
REFERENCES [dbo].[bills] ([id])
GO
ALTER TABLE [dbo].[product_bills]  WITH CHECK ADD FOREIGN KEY([product_detail_id])
REFERENCES [dbo].[product_details] ([id])
GO
ALTER TABLE [dbo].[product_details]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([id])
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD FOREIGN KEY([categorie_id])
REFERENCES [dbo].[categories] ([id])
GO
USE [master]
GO
ALTER DATABASE [shoes_store] SET  READ_WRITE 
GO
