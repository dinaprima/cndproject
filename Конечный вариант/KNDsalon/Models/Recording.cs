using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace KNDsalon.Models
{
    public class Recording
    {
        public int Id { get; set; }
        public int MasterId { get; set; }
        public virtual Master Master { get; set; }
        public int ClientId { get; set; }
        public virtual Client Client { get; set; }
        public int ServiceId { get; set; }
        //public DateTime Data_of_recording { get; set; }
        //public DateTime Time_of_recording { get; set; }
        public DateTime DateTime_of_recording { get; set; }
        public string Comment { get; set; }
    }
}
