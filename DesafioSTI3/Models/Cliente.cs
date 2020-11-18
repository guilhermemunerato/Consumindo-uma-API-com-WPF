using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace DesafioSTI3.Models
{
    [Table("Cliente")]
    public class Cliente
    {
        [Key]
        public Guid Id { get; set; }
        public string Cnpj { get; set; }
        public string Cpf { get; set; }
        public string Nome { get; set; }
        public string RazaoSocial { get; set; }
        public string Email { get; set; }
        public DateTime DataNascimento { get; set; }

    }
}
