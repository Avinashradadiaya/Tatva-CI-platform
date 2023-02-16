using System.ComponentModel.DataAnnotations;

namespace category.Models;

public class Category
{
    [Key]
    public int Id { get; set; }
    [Required]
    public string name { get; set; }
    //[Range(1,100,ErroreMessage = "Display Order must be between 1 and 100 only!!")]
    public int DisplayOrder { get; set; }
    public DateTime CreatedDateTime { get; set; } = DateTime.Now;
}
