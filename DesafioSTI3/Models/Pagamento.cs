using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace DesafioSTI3.Models
{
    [Table("Pagamento")]
    public class Pagamento
    {
        public Guid Id { get; set; }
        public int Parcela { get; set; }
        public decimal Valor { get; set; }
        public MetodoPagamento MetodoPagamento { get; set; }
        public Pedido Pedido { get; set; }
    }
}
