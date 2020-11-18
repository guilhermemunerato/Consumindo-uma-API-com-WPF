using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace DesafioSTI3.Models
{
    [Table("MetodoPagamento")]
    public class MetodoPagamento
    {
        [Key]
        public string Codigo { get; set; }
        public string Nome { get; set; }
    }
}
