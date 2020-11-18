﻿// <auto-generated />
using System;
using DesafioSTI3.Data;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

namespace DesafioSTI3.Migrations
{
    [DbContext(typeof(Contexto))]
    [Migration("20201111030543_first")]
    partial class first
    {
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .UseIdentityColumns()
                .HasAnnotation("Relational:MaxIdentifierLength", 128)
                .HasAnnotation("ProductVersion", "5.0.0");

            modelBuilder.Entity("DesafioSTI3.Models.Cliente", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uniqueidentifier");

                    b.Property<string>("Cnpj")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Cpf")
                        .HasColumnType("nvarchar(max)");

                    b.Property<DateTime>("DataNascimento")
                        .HasColumnType("datetime2");

                    b.Property<string>("Email")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Nome")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("RazaoSocial")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.ToTable("Cliente");
                });

            modelBuilder.Entity("DesafioSTI3.Models.EnderecoEntrega", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uniqueidentifier");

                    b.Property<string>("Bairro")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Cep")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Cidade")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Complemento")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Endereco")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Estado")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Numero")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Referencia")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.ToTable("EnderecoEntrega");
                });

            modelBuilder.Entity("DesafioSTI3.Models.Itens", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uniqueidentifier");

                    b.Property<Guid?>("PedidoId")
                        .HasColumnType("uniqueidentifier");

                    b.Property<Guid?>("ProdutoId")
                        .HasColumnType("uniqueidentifier");

                    b.HasKey("Id");

                    b.HasIndex("PedidoId");

                    b.HasIndex("ProdutoId");

                    b.ToTable("Itens");
                });

            modelBuilder.Entity("DesafioSTI3.Models.MetodoPagamento", b =>
                {
                    b.Property<string>("Codigo")
                        .HasColumnType("nvarchar(450)");

                    b.Property<string>("Nome")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Codigo");

                    b.ToTable("MetodoPagamento");
                });

            modelBuilder.Entity("DesafioSTI3.Models.Pagamento", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uniqueidentifier");

                    b.Property<string>("MetodoPagamentoCodigo")
                        .HasColumnType("nvarchar(450)");

                    b.Property<int>("Parcela")
                        .HasColumnType("int");

                    b.Property<Guid?>("PedidoId")
                        .HasColumnType("uniqueidentifier");

                    b.Property<decimal>("Valor")
                        .HasColumnType("decimal(18,2)");

                    b.HasKey("Id");

                    b.HasIndex("MetodoPagamentoCodigo");

                    b.HasIndex("PedidoId");

                    b.ToTable("Pagamento");
                });

            modelBuilder.Entity("DesafioSTI3.Models.Pedido", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uniqueidentifier");

                    b.Property<Guid?>("ClienteId")
                        .HasColumnType("uniqueidentifier");

                    b.Property<DateTime>("DataAlteracao")
                        .HasColumnType("datetime2");

                    b.Property<DateTime>("DataCriacao")
                        .HasColumnType("datetime2");

                    b.Property<decimal>("Desconto")
                        .HasColumnType("decimal(18,2)");

                    b.Property<Guid?>("EnderecoEntregaId")
                        .HasColumnType("uniqueidentifier");

                    b.Property<decimal>("Frete")
                        .HasColumnType("decimal(18,2)");

                    b.Property<int>("Numero")
                        .HasColumnType("int");

                    b.Property<string>("Status")
                        .HasColumnType("nvarchar(max)");

                    b.Property<decimal>("SubTotal")
                        .HasColumnType("decimal(18,2)");

                    b.Property<decimal>("ValorTotal")
                        .HasColumnType("decimal(18,2)");

                    b.HasKey("Id");

                    b.HasIndex("ClienteId");

                    b.HasIndex("EnderecoEntregaId");

                    b.ToTable("Pedido");
                });

            modelBuilder.Entity("DesafioSTI3.Models.Produto", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uniqueidentifier");

                    b.Property<string>("Nome")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int>("Quantidade")
                        .HasColumnType("int");

                    b.Property<decimal>("ValorUnitario")
                        .HasColumnType("decimal(18,2)");

                    b.HasKey("Id");

                    b.ToTable("Produto");
                });

            modelBuilder.Entity("DesafioSTI3.Models.Itens", b =>
                {
                    b.HasOne("DesafioSTI3.Models.Pedido", "Pedido")
                        .WithMany("Itens")
                        .HasForeignKey("PedidoId");

                    b.HasOne("DesafioSTI3.Models.Produto", "Produto")
                        .WithMany()
                        .HasForeignKey("ProdutoId");

                    b.Navigation("Pedido");

                    b.Navigation("Produto");
                });

            modelBuilder.Entity("DesafioSTI3.Models.Pagamento", b =>
                {
                    b.HasOne("DesafioSTI3.Models.MetodoPagamento", "MetodoPagamento")
                        .WithMany()
                        .HasForeignKey("MetodoPagamentoCodigo");

                    b.HasOne("DesafioSTI3.Models.Pedido", "Pedido")
                        .WithMany("Pagamento")
                        .HasForeignKey("PedidoId");

                    b.Navigation("MetodoPagamento");

                    b.Navigation("Pedido");
                });

            modelBuilder.Entity("DesafioSTI3.Models.Pedido", b =>
                {
                    b.HasOne("DesafioSTI3.Models.Cliente", "Cliente")
                        .WithMany()
                        .HasForeignKey("ClienteId");

                    b.HasOne("DesafioSTI3.Models.EnderecoEntrega", "EnderecoEntrega")
                        .WithMany()
                        .HasForeignKey("EnderecoEntregaId");

                    b.Navigation("Cliente");

                    b.Navigation("EnderecoEntrega");
                });

            modelBuilder.Entity("DesafioSTI3.Models.Pedido", b =>
                {
                    b.Navigation("Itens");

                    b.Navigation("Pagamento");
                });
#pragma warning restore 612, 618
        }
    }
}