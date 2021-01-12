using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApplication1.Models
{
    public class Master
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public ICollection<Service> MyServices { get; set; }

    }
}
