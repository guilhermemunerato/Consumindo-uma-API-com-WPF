using System;
using System.Collections.Generic;
using System.Text;

namespace DesafioSTI3.Models
{
    public class PedidoViewModel
    {
        public Guid Id { get; set; }
        public int Numero { get; set; }
        public DateTime DataCriacao { get; set; }
        public DateTime DataAlteracao { get; set; }
        public string Status { get; set; }
        public decimal Desconto { get; set; }
        public decimal Frete { get; set; }
        public decimal SubTotal { get; set; }
        public decimal ValorTotal { get; set; }
        public ClienteViewModel Cliente { get; set; }
        public EnderecoEntrega EnderecoEntrega { get; set; }
        public List<ItensViewModel> Itens { get; set; }
        public List<PagamentoViewModel> Pagamento { get; set; }
    }

    public class ClienteViewModel
    {
        public Guid Id { get; set; }
        public string Cnpj { get; set; }
        public string Cpf { get; set; }
        public string Nome { get; set; }
        public string RazaoSocial { get; set; }
        public string Email { get; set; }
        public DateTime DataNascimento { get; set; }
    }

    public class EnderecoEntregaViewModel
    {
        public Guid Id { get; set; }
        public string Endereco { get; set; }
        public string Numero { get; set; }
        public string Cep { get; set; }
        public string Bairro { get; set; }
        public string Cidade { get; set; }
        public string Estado { get; set; }
        public string Complemento { get; set; }
        public string Referencia { get; set; }
    }

    public class ItensViewModel
    {
        public Guid Id { get; set; }
        public Guid IdProduto { get; set; }
        public string Nome { get; set; }
        public int Quantidade { get; set; }
        public decimal ValorUnitario { get; set; }
    }

    public class PagamentoViewModel
    {
        public Guid Id { get; set; }
        public int Parcela { get; set; }
        public decimal Valor { get; set; }
        public string Codigo { get; set; }
        public string Nome { get; set; }
    }
}
