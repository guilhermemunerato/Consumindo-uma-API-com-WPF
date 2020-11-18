using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace DesafioSTI3.Models
{
    [Table("Itens")]
    public class Itens
    {
        [Key]
        public Guid Id { get; set; }
        public Produto Produto { get; set; }
        public Pedido Pedido { get; set; }

    }
}
