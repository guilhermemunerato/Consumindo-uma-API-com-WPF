using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Ucook.Models
{
    [Table("Receita")]
    public class Receita
    {
        [Key]
        public int Id { get; set; }
        
        [Required]
        [StringLength(60)]
        [Display(Name = "Nome")]
        public string Nome { get; set; }

        [Required]
        [StringLength(500)]
        [Display(Name = "Descrição")]
        public string Descricao { get; set; }

        [Required]
        [StringLength(8000)]
        [Display(Name = "Ingredientes")]
        public string Ingrediente { get; set; }

        [Required]
        [StringLength(8000)]
        [Display(Name = "Modo de Preparo")]
        public string ModoPreparo { get; set; }

        [StringLength(300)]
        [Display(Name = "Imagem")]
        public string Imagem { get; set; }
    }
}
