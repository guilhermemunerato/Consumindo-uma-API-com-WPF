using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace DesafioSTI3.Models
{
    [Table("Pedido")]
    public class Pedido
    {
        [Key]
        public Guid Id { get; set; }
        public int Numero { get; set; }
        public DateTime DataCriacao { get; set; }
        public DateTime DataAlteracao { get; set; }
        public string Status { get; set; }
        public decimal Desconto { get; set; }
        public decimal Frete { get; set; }
        public decimal SubTotal { get; set; }
        public decimal ValorTotal { get; set; }
        public Cliente Cliente { get; set; }
        public EnderecoEntrega EnderecoEntrega { get; set; }
        public List<Itens> Itens { get; set; }
        public List<Pagamento> Pagamento { get; set; }
    }
}
