USE [master]
GO
/****** Object:  Database [Dropshipping]    Script Date: 30/09/2018 18:27:30 ******/
CREATE DATABASE [Dropshipping]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Dropshipping', FILENAME = N'D:\RDSDBDATA\DATA\Dropshipping.mdf' , SIZE = 16512KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'Dropshipping_log', FILENAME = N'D:\RDSDBDATA\DATA\Dropshipping_log.ldf' , SIZE = 1536KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Dropshipping] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Dropshipping].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Dropshipping] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Dropshipping] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Dropshipping] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Dropshipping] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Dropshipping] SET ARITHABORT OFF 
GO
ALTER DATABASE [Dropshipping] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Dropshipping] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Dropshipping] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Dropshipping] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Dropshipping] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Dropshipping] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Dropshipping] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Dropshipping] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Dropshipping] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Dropshipping] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Dropshipping] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Dropshipping] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Dropshipping] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Dropshipping] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Dropshipping] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Dropshipping] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Dropshipping] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Dropshipping] SET RECOVERY FULL 
GO
ALTER DATABASE [Dropshipping] SET  MULTI_USER 
GO
ALTER DATABASE [Dropshipping] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Dropshipping] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Dropshipping] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Dropshipping] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Dropshipping] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Dropshipping]
GO
/****** Object:  User [yagohf]    Script Date: 30/09/2018 18:27:33 ******/
CREATE USER [yagohf] FOR LOGIN [yagohf] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [appDropshipping]    Script Date: 30/09/2018 18:27:33 ******/
CREATE USER [appDropshipping] FOR LOGIN [appDropshipping] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [yagohf]
GO
ALTER ROLE [db_owner] ADD MEMBER [appDropshipping]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [appDropshipping]
GO
ALTER ROLE [db_datareader] ADD MEMBER [appDropshipping]
GO
/****** Object:  Table [dbo].[Atendimento]    Script Date: 30/09/2018 18:27:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Atendimento](
	[Id] [int] NOT NULL,
	[IdAtendimentoTipo] [int] NOT NULL,
	[IdCliente] [int] NOT NULL,
	[IdAtendente] [int] NULL,
	[IdPedido] [int] NULL,
	[IdPedidoItem] [int] NULL,
	[Titulo] [varchar](100) NOT NULL,
	[Descricao] [varchar](8000) NOT NULL,
	[Finalizado] [bit] NOT NULL,
 CONSTRAINT [PK_Solicitacao] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AtendimentoAvaliacao]    Script Date: 30/09/2018 18:27:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AtendimentoAvaliacao](
	[IdAtendimento] [int] NOT NULL,
	[Classificacao] [int] NOT NULL,
	[ObservacaoCliente] [varchar](8000) NULL,
	[ObservacaoAtendente] [varchar](8000) NULL,
 CONSTRAINT [PK_AtendimentoAvaliacao] PRIMARY KEY CLUSTERED 
(
	[IdAtendimento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AtendimentoChat]    Script Date: 30/09/2018 18:27:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AtendimentoChat](
	[Id] [int] NOT NULL,
	[IdAtendimento] [int] NOT NULL,
	[IdAutor] [int] NOT NULL,
	[Texto] [varchar](4000) NOT NULL,
	[DataEnvio] [datetime] NOT NULL,
 CONSTRAINT [PK_AtendimentoChat] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AtendimentoTipo]    Script Date: 30/09/2018 18:27:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AtendimentoTipo](
	[Id] [int] NOT NULL,
	[Nome] [varchar](100) NOT NULL,
	[Descricao] [varchar](400) NOT NULL,
 CONSTRAINT [PK_AtendimentoTipo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_AtendimentoTipo_Nome] UNIQUE NONCLUSTERED 
(
	[Nome] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Fornecedor]    Script Date: 30/09/2018 18:27:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Fornecedor](
	[Id] [int] NOT NULL,
	[Ativo] [bit] NOT NULL,
	[EnderecoConsultarEstoque] [varchar](400) NOT NULL,
	[EnderecoRealizarPedido] [varchar](400) NOT NULL,
	[EnderecoCancelarPedido] [varchar](400) NOT NULL,
	[UsuarioServico] [varchar](100) NOT NULL,
	[SenhaServico] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Fornecedor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Log]    Script Date: 30/09/2018 18:27:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Log](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Message] [nvarchar](max) NULL,
	[MessageTemplate] [nvarchar](max) NULL,
	[Level] [nvarchar](128) NULL,
	[TimeStamp] [datetimeoffset](7) NOT NULL,
	[Exception] [nvarchar](max) NULL,
	[LogEvent] [nvarchar](max) NULL,
 CONSTRAINT [PK_Log] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pagamento]    Script Date: 30/09/2018 18:27:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Pagamento](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdPedido] [int] NOT NULL,
	[IdPagamentoStatus] [int] NOT NULL,
	[ChaveTransacao] [varchar](36) NOT NULL,
	[DescricaoPagamento] [varchar](300) NOT NULL,
	[XMLTransacao] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Pagamento] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PagamentoEstorno]    Script Date: 30/09/2018 18:27:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PagamentoEstorno](
	[Id] [int] NOT NULL,
	[IdPagamento] [int] NOT NULL,
	[IdPedidoItem] [int] NOT NULL,
	[Data] [datetime] NOT NULL,
	[Valor] [decimal](20, 2) NOT NULL,
	[XMLTransacao] [varchar](max) NULL,
 CONSTRAINT [PK_PagamentoEstorno] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PagamentoEvento]    Script Date: 30/09/2018 18:27:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PagamentoEvento](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdPagamento] [int] NOT NULL,
	[IdPagamentoStatus] [int] NOT NULL,
	[DataRecebimento] [datetime] NOT NULL,
	[XMLTransacao] [varchar](max) NOT NULL,
 CONSTRAINT [PK_PagamentoEvento] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PagamentoStatus]    Script Date: 30/09/2018 18:27:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PagamentoStatus](
	[Id] [int] NOT NULL,
	[Nome] [varchar](100) NOT NULL,
	[Descricao] [varchar](400) NOT NULL,
 CONSTRAINT [PK_PagamentoStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_PagamentoStatus_Nome] UNIQUE NONCLUSTERED 
(
	[Nome] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Pedido]    Script Date: 30/09/2018 18:27:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedido](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdCliente] [int] NOT NULL,
	[IdVendedor] [int] NULL,
	[Data] [datetime] NOT NULL,
	[ValorProdutos] [decimal](20, 2) NOT NULL,
	[Desconto] [decimal](20, 2) NOT NULL,
	[ValorPago] [decimal](20, 2) NOT NULL,
 CONSTRAINT [PK_Venda] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PedidoEndereco]    Script Date: 30/09/2018 18:27:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PedidoEndereco](
	[IdPedido] [int] NOT NULL,
	[Logradouro] [varchar](100) NOT NULL,
	[Numero] [varchar](10) NOT NULL,
	[Observacao] [varchar](200) NULL,
	[Bairro] [varchar](100) NOT NULL,
	[Cidade] [varchar](150) NOT NULL,
	[Estado] [varchar](100) NOT NULL,
	[CEP] [varchar](10) NOT NULL,
 CONSTRAINT [PK_PedidoEndereco] PRIMARY KEY CLUSTERED 
(
	[IdPedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PedidoFornecedor]    Script Date: 30/09/2018 18:27:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PedidoFornecedor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdFornecedor] [int] NOT NULL,
	[IdPedidoItem] [int] NOT NULL,
	[ChavePedidoFornecedor] [varchar](100) NOT NULL,
	[IdPedidoFornecedorStatus] [int] NOT NULL,
 CONSTRAINT [PK_PedidoFornecedor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PedidoFornecedorEvento]    Script Date: 30/09/2018 18:27:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PedidoFornecedorEvento](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdPedidoFornecedor] [int] NOT NULL,
	[IdPedidoFornecedorStatus] [int] NOT NULL,
	[DataOcorrencia] [datetime] NOT NULL,
	[InformacoesAdicionais] [varchar](4000) NULL,
 CONSTRAINT [PK_PedidoFornecedorEvento] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PedidoFornecedorStatus]    Script Date: 30/09/2018 18:27:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PedidoFornecedorStatus](
	[Id] [int] NOT NULL,
	[Nome] [varchar](100) NOT NULL,
	[Descricao] [varchar](400) NOT NULL,
 CONSTRAINT [PK_PedidoFornecedorStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PedidoItem]    Script Date: 30/09/2018 18:27:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PedidoItem](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdPedido] [int] NOT NULL,
	[IdProduto] [int] NOT NULL,
	[PrecoCusto] [decimal](20, 2) NOT NULL,
	[PrecoVenda] [decimal](20, 2) NOT NULL,
	[Quantidade] [int] NOT NULL,
	[Desconto] [decimal](20, 2) NOT NULL,
	[PrecoFinal] [decimal](20, 2) NOT NULL,
 CONSTRAINT [PK_PedidoItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PedidoItemAvaliacao]    Script Date: 30/09/2018 18:27:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PedidoItemAvaliacao](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Classificacao] [int] NOT NULL,
	[DescricaoAvaliacao] [varchar](4000) NOT NULL,
	[IdPedidoItem] [int] NOT NULL,
 CONSTRAINT [PK_ProdutoAvaliacao] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Perfil]    Script Date: 30/09/2018 18:27:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Perfil](
	[Id] [int] NOT NULL,
	[Nome] [varchar](50) NOT NULL,
	[Descricao] [varchar](200) NOT NULL,
 CONSTRAINT [PK_Perfil] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_Perfil_Nome] UNIQUE NONCLUSTERED 
(
	[Nome] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Pessoa]    Script Date: 30/09/2018 18:27:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Pessoa](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NULL,
	[Nome] [varchar](100) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Telefone] [varchar](20) NULL,
	[Documento] [varchar](30) NOT NULL,
 CONSTRAINT [PK_Pessoa] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PessoaEndereco]    Script Date: 30/09/2018 18:27:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PessoaEndereco](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdPessoa] [int] NOT NULL,
	[Apelido] [varchar](100) NOT NULL,
	[Logradouro] [varchar](100) NOT NULL,
	[Numero] [varchar](10) NOT NULL,
	[Observacao] [varchar](200) NULL,
	[Bairro] [varchar](100) NOT NULL,
	[Cidade] [varchar](150) NOT NULL,
	[Estado] [varchar](100) NOT NULL,
	[CEP] [varchar](10) NOT NULL,
 CONSTRAINT [PK_PessoaEndereco] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Produto]    Script Date: 30/09/2018 18:27:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Produto](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdFornecedor] [int] NOT NULL,
	[ChaveProdutoFornecedor] [varchar](100) NOT NULL,
	[Nome] [varchar](100) NOT NULL,
	[Descricao] [varchar](8000) NOT NULL,
	[Disponivel] [bit] NOT NULL,
	[PrecoCusto] [decimal](20, 2) NOT NULL,
	[PrecoVenda] [decimal](20, 2) NOT NULL,
	[DataCadastro] [datetime] NOT NULL,
	[IdProdutoCategoria] [int] NOT NULL,
	[Ativo] [bit] NOT NULL,
 CONSTRAINT [PK_Produto] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_IdFornecedorChaveFornecedor] UNIQUE NONCLUSTERED 
(
	[IdFornecedor] ASC,
	[ChaveProdutoFornecedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProdutoCategoria]    Script Date: 30/09/2018 18:27:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProdutoCategoria](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](100) NOT NULL,
	[Descricao] [varchar](400) NOT NULL,
 CONSTRAINT [PK_ProdutoCategoria] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_Nome] UNIQUE NONCLUSTERED 
(
	[Nome] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProdutoPromocao]    Script Date: 30/09/2018 18:27:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProdutoPromocao](
	[IdPromocao] [int] NOT NULL,
	[IdProduto] [int] NOT NULL,
	[PrecoVenda] [decimal](20, 2) NOT NULL,
 CONSTRAINT [PK_ProdutoPromocao] PRIMARY KEY CLUSTERED 
(
	[IdPromocao] ASC,
	[IdProduto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Promocao]    Script Date: 30/09/2018 18:27:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Promocao](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](100) NOT NULL,
	[Descricao] [varchar](400) NOT NULL,
	[DataInicio] [datetime] NOT NULL,
	[DataFimPrevisto] [datetime] NULL,
	[DataFim] [datetime] NULL,
	[Ativa] [bit] NOT NULL,
 CONSTRAINT [PK_Promocao] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_Promocao_Nome] UNIQUE NONCLUSTERED 
(
	[Nome] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Propaganda]    Script Date: 30/09/2018 18:27:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Propaganda](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Posicao] [int] NOT NULL,
	[Nome] [varchar](100) NOT NULL,
	[Descricao] [varchar](400) NOT NULL,
	[Url] [varchar](1024) NOT NULL,
	[Ativo] [bit] NOT NULL,
 CONSTRAINT [PK_Propaganda] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_Propaganda_Posicao_Ativo] UNIQUE NONCLUSTERED 
(
	[Posicao] ASC,
	[Ativo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 30/09/2018 18:27:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Login] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_Usuario] UNIQUE NONCLUSTERED 
(
	[Login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Atendimento]  WITH CHECK ADD  CONSTRAINT [FK_Atendimento_AtendimentoTipo] FOREIGN KEY([IdAtendimentoTipo])
REFERENCES [dbo].[AtendimentoTipo] ([Id])
GO
ALTER TABLE [dbo].[Atendimento] CHECK CONSTRAINT [FK_Atendimento_AtendimentoTipo]
GO
ALTER TABLE [dbo].[Atendimento]  WITH CHECK ADD  CONSTRAINT [FK_Atendimento_Pessoa] FOREIGN KEY([IdAtendente])
REFERENCES [dbo].[Pessoa] ([Id])
GO
ALTER TABLE [dbo].[Atendimento] CHECK CONSTRAINT [FK_Atendimento_Pessoa]
GO
ALTER TABLE [dbo].[Atendimento]  WITH CHECK ADD  CONSTRAINT [FK_Solicitacao_Pedido] FOREIGN KEY([IdPedido])
REFERENCES [dbo].[Pedido] ([Id])
GO
ALTER TABLE [dbo].[Atendimento] CHECK CONSTRAINT [FK_Solicitacao_Pedido]
GO
ALTER TABLE [dbo].[Atendimento]  WITH CHECK ADD  CONSTRAINT [FK_Solicitacao_PedidoItem] FOREIGN KEY([IdPedidoItem])
REFERENCES [dbo].[PedidoItem] ([Id])
GO
ALTER TABLE [dbo].[Atendimento] CHECK CONSTRAINT [FK_Solicitacao_PedidoItem]
GO
ALTER TABLE [dbo].[Atendimento]  WITH CHECK ADD  CONSTRAINT [FK_Solicitacao_Pessoa] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Pessoa] ([Id])
GO
ALTER TABLE [dbo].[Atendimento] CHECK CONSTRAINT [FK_Solicitacao_Pessoa]
GO
ALTER TABLE [dbo].[AtendimentoAvaliacao]  WITH CHECK ADD  CONSTRAINT [FK_AtendimentoAvaliacao_Atendimento] FOREIGN KEY([IdAtendimento])
REFERENCES [dbo].[Atendimento] ([Id])
GO
ALTER TABLE [dbo].[AtendimentoAvaliacao] CHECK CONSTRAINT [FK_AtendimentoAvaliacao_Atendimento]
GO
ALTER TABLE [dbo].[AtendimentoChat]  WITH CHECK ADD  CONSTRAINT [FK_AtendimentoChat_Atendimento] FOREIGN KEY([IdAtendimento])
REFERENCES [dbo].[Atendimento] ([Id])
GO
ALTER TABLE [dbo].[AtendimentoChat] CHECK CONSTRAINT [FK_AtendimentoChat_Atendimento]
GO
ALTER TABLE [dbo].[AtendimentoChat]  WITH CHECK ADD  CONSTRAINT [FK_AtendimentoChat_Pessoa] FOREIGN KEY([IdAutor])
REFERENCES [dbo].[Pessoa] ([Id])
GO
ALTER TABLE [dbo].[AtendimentoChat] CHECK CONSTRAINT [FK_AtendimentoChat_Pessoa]
GO
ALTER TABLE [dbo].[Fornecedor]  WITH CHECK ADD  CONSTRAINT [FK_Fornecedor_Pessoa] FOREIGN KEY([Id])
REFERENCES [dbo].[Pessoa] ([Id])
GO
ALTER TABLE [dbo].[Fornecedor] CHECK CONSTRAINT [FK_Fornecedor_Pessoa]
GO
ALTER TABLE [dbo].[Pagamento]  WITH CHECK ADD  CONSTRAINT [FK_Pagamento_PagamentoStatus] FOREIGN KEY([IdPagamentoStatus])
REFERENCES [dbo].[PagamentoStatus] ([Id])
GO
ALTER TABLE [dbo].[Pagamento] CHECK CONSTRAINT [FK_Pagamento_PagamentoStatus]
GO
ALTER TABLE [dbo].[Pagamento]  WITH CHECK ADD  CONSTRAINT [FK_Pagamento_Pedido] FOREIGN KEY([IdPedido])
REFERENCES [dbo].[Pedido] ([Id])
GO
ALTER TABLE [dbo].[Pagamento] CHECK CONSTRAINT [FK_Pagamento_Pedido]
GO
ALTER TABLE [dbo].[PagamentoEstorno]  WITH CHECK ADD  CONSTRAINT [FK_PagamentoEstorno_Pagamento] FOREIGN KEY([Id])
REFERENCES [dbo].[Pagamento] ([Id])
GO
ALTER TABLE [dbo].[PagamentoEstorno] CHECK CONSTRAINT [FK_PagamentoEstorno_Pagamento]
GO
ALTER TABLE [dbo].[PagamentoEstorno]  WITH CHECK ADD  CONSTRAINT [FK_PagamentoEstorno_PedidoItem] FOREIGN KEY([Id])
REFERENCES [dbo].[PedidoItem] ([Id])
GO
ALTER TABLE [dbo].[PagamentoEstorno] CHECK CONSTRAINT [FK_PagamentoEstorno_PedidoItem]
GO
ALTER TABLE [dbo].[PagamentoEvento]  WITH CHECK ADD  CONSTRAINT [FK_PagamentoEvento_Pagamento] FOREIGN KEY([IdPagamento])
REFERENCES [dbo].[Pagamento] ([Id])
GO
ALTER TABLE [dbo].[PagamentoEvento] CHECK CONSTRAINT [FK_PagamentoEvento_Pagamento]
GO
ALTER TABLE [dbo].[PagamentoEvento]  WITH CHECK ADD  CONSTRAINT [FK_PagamentoEvento_PagamentoStatus] FOREIGN KEY([IdPagamentoStatus])
REFERENCES [dbo].[PagamentoStatus] ([Id])
GO
ALTER TABLE [dbo].[PagamentoEvento] CHECK CONSTRAINT [FK_PagamentoEvento_PagamentoStatus]
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD  CONSTRAINT [FK_Pedido_Cliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Pessoa] ([Id])
GO
ALTER TABLE [dbo].[Pedido] CHECK CONSTRAINT [FK_Pedido_Cliente]
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD  CONSTRAINT [FK_Pedido_Vendedor] FOREIGN KEY([IdVendedor])
REFERENCES [dbo].[Pessoa] ([Id])
GO
ALTER TABLE [dbo].[Pedido] CHECK CONSTRAINT [FK_Pedido_Vendedor]
GO
ALTER TABLE [dbo].[PedidoEndereco]  WITH CHECK ADD  CONSTRAINT [FK_PedidoEndereco_Pedido] FOREIGN KEY([IdPedido])
REFERENCES [dbo].[Pedido] ([Id])
GO
ALTER TABLE [dbo].[PedidoEndereco] CHECK CONSTRAINT [FK_PedidoEndereco_Pedido]
GO
ALTER TABLE [dbo].[PedidoFornecedor]  WITH CHECK ADD  CONSTRAINT [FK_PedidoFornecedor_Fornecedor] FOREIGN KEY([IdFornecedor])
REFERENCES [dbo].[Fornecedor] ([Id])
GO
ALTER TABLE [dbo].[PedidoFornecedor] CHECK CONSTRAINT [FK_PedidoFornecedor_Fornecedor]
GO
ALTER TABLE [dbo].[PedidoFornecedor]  WITH CHECK ADD  CONSTRAINT [FK_PedidoFornecedor_PedidoFornecedorStatus] FOREIGN KEY([IdPedidoFornecedorStatus])
REFERENCES [dbo].[PedidoFornecedorStatus] ([Id])
GO
ALTER TABLE [dbo].[PedidoFornecedor] CHECK CONSTRAINT [FK_PedidoFornecedor_PedidoFornecedorStatus]
GO
ALTER TABLE [dbo].[PedidoFornecedor]  WITH CHECK ADD  CONSTRAINT [FK_PedidoFornecedor_PedidoItem] FOREIGN KEY([IdPedidoItem])
REFERENCES [dbo].[PedidoItem] ([Id])
GO
ALTER TABLE [dbo].[PedidoFornecedor] CHECK CONSTRAINT [FK_PedidoFornecedor_PedidoItem]
GO
ALTER TABLE [dbo].[PedidoFornecedorEvento]  WITH CHECK ADD  CONSTRAINT [FK_PedidoFornecedorEvento_PedidoFornecedor] FOREIGN KEY([IdPedidoFornecedor])
REFERENCES [dbo].[PedidoFornecedor] ([Id])
GO
ALTER TABLE [dbo].[PedidoFornecedorEvento] CHECK CONSTRAINT [FK_PedidoFornecedorEvento_PedidoFornecedor]
GO
ALTER TABLE [dbo].[PedidoFornecedorEvento]  WITH CHECK ADD  CONSTRAINT [FK_PedidoFornecedorEvento_PedidoFornecedorStatus] FOREIGN KEY([IdPedidoFornecedorStatus])
REFERENCES [dbo].[PedidoFornecedorStatus] ([Id])
GO
ALTER TABLE [dbo].[PedidoFornecedorEvento] CHECK CONSTRAINT [FK_PedidoFornecedorEvento_PedidoFornecedorStatus]
GO
ALTER TABLE [dbo].[PedidoItem]  WITH CHECK ADD  CONSTRAINT [FK_PedidoItem_Pedido] FOREIGN KEY([IdPedido])
REFERENCES [dbo].[Pedido] ([Id])
GO
ALTER TABLE [dbo].[PedidoItem] CHECK CONSTRAINT [FK_PedidoItem_Pedido]
GO
ALTER TABLE [dbo].[PedidoItem]  WITH CHECK ADD  CONSTRAINT [FK_PedidoItem_Produto] FOREIGN KEY([IdProduto])
REFERENCES [dbo].[Produto] ([Id])
GO
ALTER TABLE [dbo].[PedidoItem] CHECK CONSTRAINT [FK_PedidoItem_Produto]
GO
ALTER TABLE [dbo].[PedidoItemAvaliacao]  WITH CHECK ADD  CONSTRAINT [FK_PedidoItemAvaliacao_PedidoItem] FOREIGN KEY([IdPedidoItem])
REFERENCES [dbo].[PedidoItem] ([Id])
GO
ALTER TABLE [dbo].[PedidoItemAvaliacao] CHECK CONSTRAINT [FK_PedidoItemAvaliacao_PedidoItem]
GO
ALTER TABLE [dbo].[Pessoa]  WITH CHECK ADD  CONSTRAINT [FK_Pessoa_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[Pessoa] CHECK CONSTRAINT [FK_Pessoa_Usuario]
GO
ALTER TABLE [dbo].[PessoaEndereco]  WITH CHECK ADD  CONSTRAINT [FK_PessoaEndereco_Pessoa] FOREIGN KEY([IdPessoa])
REFERENCES [dbo].[Pessoa] ([Id])
GO
ALTER TABLE [dbo].[PessoaEndereco] CHECK CONSTRAINT [FK_PessoaEndereco_Pessoa]
GO
ALTER TABLE [dbo].[Produto]  WITH CHECK ADD  CONSTRAINT [FK_Produto_Fornecedor] FOREIGN KEY([IdFornecedor])
REFERENCES [dbo].[Fornecedor] ([Id])
GO
ALTER TABLE [dbo].[Produto] CHECK CONSTRAINT [FK_Produto_Fornecedor]
GO
ALTER TABLE [dbo].[Produto]  WITH CHECK ADD  CONSTRAINT [FK_Produto_ProdutoCategoria] FOREIGN KEY([IdProdutoCategoria])
REFERENCES [dbo].[ProdutoCategoria] ([Id])
GO
ALTER TABLE [dbo].[Produto] CHECK CONSTRAINT [FK_Produto_ProdutoCategoria]
GO
ALTER TABLE [dbo].[ProdutoPromocao]  WITH CHECK ADD  CONSTRAINT [FK_ProdutoPromocao_Produto] FOREIGN KEY([IdProduto])
REFERENCES [dbo].[Produto] ([Id])
GO
ALTER TABLE [dbo].[ProdutoPromocao] CHECK CONSTRAINT [FK_ProdutoPromocao_Produto]
GO
ALTER TABLE [dbo].[ProdutoPromocao]  WITH CHECK ADD  CONSTRAINT [FK_ProdutoPromocao_Promocao] FOREIGN KEY([IdPromocao])
REFERENCES [dbo].[Promocao] ([Id])
GO
ALTER TABLE [dbo].[ProdutoPromocao] CHECK CONSTRAINT [FK_ProdutoPromocao_Promocao]
GO
USE [master]
GO
ALTER DATABASE [Dropshipping] SET  READ_WRITE 
GO
