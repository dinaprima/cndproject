using KNDsalon.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace KNDsalon
{
    public static class SampleData
    {
        public static void Initialize(ApplicationDbContext context)
        {
            Master master1 = new Master
            {
                Name = "Ксения Чебыкина"
            };
            Master master2 = new Master
            {
                Name = "Анастасия Гнутова"
            };
            Master master3 = new Master
            {
                Name = "Диана Салахитинова"
            };
            Service service1 = new Service
            {
                Name_of_service = "Маникюр без покрытия",
                Cost = 800,
                Master = master3
            };
            Service service2 = new Service
            {
                Name_of_service = "Маникюр с покрытием Luxio",
                Cost = 1900,
                Master = master3
            };
            Service service3 = new Service
            {
                Name_of_service = "Укрепление ногтевой пластины",
                Cost = 400,
                Master = master3
            };
            Service service4 = new Service
            {
                Name_of_service = "Педикюр без покрытия",
                Cost = 1100,
                Master = master3
            };
            Service service5 = new Service
            {
                Name_of_service = "Педикюр с покрытием Luxio",
                Cost = 2500,
                Master = master3
            };
            Service service6 = new Service
            {
                Name_of_service = "Стрижка женская (модельная)",
                Cost = 900,
                Master = master2
            };
            Service service7 = new Service
            {
                Name_of_service = "Челка",
                Cost = 400,
                Master = master2
            };
            Service service8 = new Service
            {
                Name_of_service = "Кончики",
                Cost = 800,
                Master = master2
            };
            Service service9 = new Service
            {
                Name_of_service = "Выпрямление",
                Cost = 600,
                Master = master2
            };
            Service service10 = new Service
            {
                Name_of_service = "Накрутка+стайлинг",
                Cost = 800,
                Master = master2
            };
            Service service11 = new Service
            {
                Name_of_service = "Ботокс для волос",
                Cost = 2300,
                Master = master2
            };
            Service service12 = new Service
            {
                Name_of_service = "Кератиновое выпрямление",
                Cost = 2000,
                Master = master2
            };
            Service service13 = new Service
            {
                Name_of_service = "Чистка лица (механическая)",
                Cost = 1500,
                Master = master1
            };
            Service service14 = new Service
            {
                Name_of_service = "Чистка с альгинатной маской",
                Cost = 1700,
                Master = master1
            };
            Service service15 = new Service
            {
                Name_of_service = "Чистка комбинированная",
                Cost = 1700,
                Master = master1
            };
            Service service16 = new Service
            {
                Name_of_service = "Массаж косметический",
                Cost = 1300,
                Master = master1
            };
            Service service17 = new Service
            {
                Name_of_service = "Массаж Тоффа",
                Cost = 1500,
                Master = master1
            };
            Service service18 = new Service
            {
                Name_of_service = "Пилинг молочный",
                Cost = 1200,
                Master = master1
            };
            Service service19 = new Service
            {
                Name_of_service = "Пилинг Джесснера",
                Cost = 1500,
                Master = master1
            };

            if (!context.Masters.Any())
            {
                context.Masters.AddRange(master1, master2, master3);
                context.SaveChanges();
            }

            if (!context.Services.Any())
            {
                context.Services.AddRange(service1, service2, service3, service4, service5, service6, service7, service8, service9, service10, service11, service12, service13, service14, service15, service16, service17, service18, service19);
                context.SaveChanges();
            }
        }
    }
}
