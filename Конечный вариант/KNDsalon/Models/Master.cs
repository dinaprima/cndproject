using System.Collections.Generic;

namespace KNDsalon.Models
{
    public class Master
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public List<Service> Services { get; set; }
        public List<Recording> Recordings { get; set; }
    }
}
