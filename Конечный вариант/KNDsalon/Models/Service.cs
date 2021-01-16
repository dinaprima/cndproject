using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace KNDsalon.Models
{
    public class Service
    {
        public int Id { get; set; }
        public string Name_of_service { get; set; }
        public int Cost { get; set; }
        public int MasterId { get; set; }
        public virtual Master Master { get; set; }
    }
}
