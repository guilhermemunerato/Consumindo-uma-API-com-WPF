USE [master]
GO
/****** Object:  Database [DesafioSTI3DB]    Script Date: 11/11/2020 00:16:03 ******/
CREATE DATABASE [DesafioSTI3DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DesafioSTI3DB', FILENAME = N'C:\Users\gallo\DesafioSTI3DB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DesafioSTI3DB_log', FILENAME = N'C:\Users\gallo\DesafioSTI3DB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DesafioSTI3DB] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DesafioSTI3DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DesafioSTI3DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DesafioSTI3DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DesafioSTI3DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DesafioSTI3DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DesafioSTI3DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [DesafioSTI3DB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DesafioSTI3DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DesafioSTI3DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DesafioSTI3DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DesafioSTI3DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DesafioSTI3DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DesafioSTI3DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DesafioSTI3DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DesafioSTI3DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DesafioSTI3DB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DesafioSTI3DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DesafioSTI3DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DesafioSTI3DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DesafioSTI3DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DesafioSTI3DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DesafioSTI3DB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [DesafioSTI3DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DesafioSTI3DB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DesafioSTI3DB] SET  MULTI_USER 
GO
ALTER DATABASE [DesafioSTI3DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DesafioSTI3DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DesafioSTI3DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DesafioSTI3DB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DesafioSTI3DB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DesafioSTI3DB] SET QUERY_STORE = OFF
GO
USE [DesafioSTI3DB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [DesafioSTI3DB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 11/11/2020 00:16:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 11/11/2020 00:16:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[Id] [uniqueidentifier] NOT NULL,
	[Cnpj] [nvarchar](max) NULL,
	[Cpf] [nvarchar](max) NULL,
	[Nome] [nvarchar](max) NULL,
	[RazaoSocial] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[DataNascimento] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnderecoEntrega]    Script Date: 11/11/2020 00:16:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnderecoEntrega](
	[Id] [uniqueidentifier] NOT NULL,
	[Endereco] [nvarchar](max) NULL,
	[Numero] [nvarchar](max) NULL,
	[Cep] [nvarchar](max) NULL,
	[Bairro] [nvarchar](max) NULL,
	[Cidade] [nvarchar](max) NULL,
	[Estado] [nvarchar](max) NULL,
	[Complemento] [nvarchar](max) NULL,
	[Referencia] [nvarchar](max) NULL,
 CONSTRAINT [PK_EnderecoEntrega] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Itens]    Script Date: 11/11/2020 00:16:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Itens](
	[Id] [uniqueidentifier] NOT NULL,
	[ProdutoId] [uniqueidentifier] NULL,
	[PedidoId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Itens] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MetodoPagamento]    Script Date: 11/11/2020 00:16:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MetodoPagamento](
	[Codigo] [nvarchar](450) NOT NULL,
	[Nome] [nvarchar](max) NULL,
 CONSTRAINT [PK_MetodoPagamento] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pagamento]    Script Date: 11/11/2020 00:16:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pagamento](
	[Id] [uniqueidentifier] NOT NULL,
	[Parcela] [int] NOT NULL,
	[Valor] [decimal](18, 2) NOT NULL,
	[MetodoPagamentoCodigo] [nvarchar](450) NULL,
	[PedidoId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Pagamento] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pedido]    Script Date: 11/11/2020 00:16:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedido](
	[Id] [uniqueidentifier] NOT NULL,
	[Numero] [int] NOT NULL,
	[DataCriacao] [datetime2](7) NOT NULL,
	[DataAlteracao] [datetime2](7) NOT NULL,
	[Status] [nvarchar](max) NULL,
	[Desconto] [decimal](18, 2) NOT NULL,
	[Frete] [decimal](18, 2) NOT NULL,
	[SubTotal] [decimal](18, 2) NOT NULL,
	[ValorTotal] [decimal](18, 2) NOT NULL,
	[ClienteId] [uniqueidentifier] NULL,
	[EnderecoEntregaId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Pedido] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Produto]    Script Date: 11/11/2020 00:16:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Produto](
	[Id] [uniqueidentifier] NOT NULL,
	[Nome] [nvarchar](max) NULL,
	[Quantidade] [int] NOT NULL,
	[ValorUnitario] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Produto] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [IX_Itens_PedidoId]    Script Date: 11/11/2020 00:16:03 ******/
CREATE NONCLUSTERED INDEX [IX_Itens_PedidoId] ON [dbo].[Itens]
(
	[PedidoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Itens_ProdutoId]    Script Date: 11/11/2020 00:16:03 ******/
CREATE NONCLUSTERED INDEX [IX_Itens_ProdutoId] ON [dbo].[Itens]
(
	[ProdutoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Pagamento_MetodoPagamentoCodigo]    Script Date: 11/11/2020 00:16:03 ******/
CREATE NONCLUSTERED INDEX [IX_Pagamento_MetodoPagamentoCodigo] ON [dbo].[Pagamento]
(
	[MetodoPagamentoCodigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Pagamento_PedidoId]    Script Date: 11/11/2020 00:16:03 ******/
CREATE NONCLUSTERED INDEX [IX_Pagamento_PedidoId] ON [dbo].[Pagamento]
(
	[PedidoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Pedido_ClienteId]    Script Date: 11/11/2020 00:16:03 ******/
CREATE NONCLUSTERED INDEX [IX_Pedido_ClienteId] ON [dbo].[Pedido]
(
	[ClienteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Pedido_EnderecoEntregaId]    Script Date: 11/11/2020 00:16:03 ******/
CREATE NONCLUSTERED INDEX [IX_Pedido_EnderecoEntregaId] ON [dbo].[Pedido]
(
	[EnderecoEntregaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Itens]  WITH CHECK ADD  CONSTRAINT [FK_Itens_Pedido_PedidoId] FOREIGN KEY([PedidoId])
REFERENCES [dbo].[Pedido] ([Id])
GO
ALTER TABLE [dbo].[Itens] CHECK CONSTRAINT [FK_Itens_Pedido_PedidoId]
GO
ALTER TABLE [dbo].[Itens]  WITH CHECK ADD  CONSTRAINT [FK_Itens_Produto_ProdutoId] FOREIGN KEY([ProdutoId])
REFERENCES [dbo].[Produto] ([Id])
GO
ALTER TABLE [dbo].[Itens] CHECK CONSTRAINT [FK_Itens_Produto_ProdutoId]
GO
ALTER TABLE [dbo].[Pagamento]  WITH CHECK ADD  CONSTRAINT [FK_Pagamento_MetodoPagamento_MetodoPagamentoCodigo] FOREIGN KEY([MetodoPagamentoCodigo])
REFERENCES [dbo].[MetodoPagamento] ([Codigo])
GO
ALTER TABLE [dbo].[Pagamento] CHECK CONSTRAINT [FK_Pagamento_MetodoPagamento_MetodoPagamentoCodigo]
GO
ALTER TABLE [dbo].[Pagamento]  WITH CHECK ADD  CONSTRAINT [FK_Pagamento_Pedido_PedidoId] FOREIGN KEY([PedidoId])
REFERENCES [dbo].[Pedido] ([Id])
GO
ALTER TABLE [dbo].[Pagamento] CHECK CONSTRAINT [FK_Pagamento_Pedido_PedidoId]
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD  CONSTRAINT [FK_Pedido_Cliente_ClienteId] FOREIGN KEY([ClienteId])
REFERENCES [dbo].[Cliente] ([Id])
GO
ALTER TABLE [dbo].[Pedido] CHECK CONSTRAINT [FK_Pedido_Cliente_ClienteId]
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD  CONSTRAINT [FK_Pedido_EnderecoEntrega_EnderecoEntregaId] FOREIGN KEY([EnderecoEntregaId])
REFERENCES [dbo].[EnderecoEntrega] ([Id])
GO
ALTER TABLE [dbo].[Pedido] CHECK CONSTRAINT [FK_Pedido_EnderecoEntrega_EnderecoEntregaId]
GO
USE [master]
GO
ALTER DATABASE [DesafioSTI3DB] SET  READ_WRITE 
GO
