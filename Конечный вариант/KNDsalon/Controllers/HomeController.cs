using KNDsalon.Models;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Linq;

namespace KNDsalon.Controllers
{
    public class HomeController : Controller
    {
        ApplicationDbContext db;

        public HomeController(ApplicationDbContext context)
        {

            db = context;
        }

        [HttpGet]
        public IActionResult Index()
        {
            //Получаем всех мастеров
            IQueryable<Master> masters = db.Masters;

            //Передаем их в представление
            return View(masters.ToList());
        }

        [HttpPost]
        public IActionResult Index(Client client, Recording record) /*Получаем данные о клиенте и записи из формы*/
        {
            //проверяем, есть ли клиент в базе данных
            if (!db.Clients.Any(c => c.Email == client.Email))
            {
                //Добавляем нового клиента в бд
                db.Clients.Add(new Client { Name = client.Name, Email = client.Email, Phone = client.Phone });
                //Обновляем бд
                db.SaveChanges();
            }

            //получить клиента(нужно получить его ID для работы с записью)
            Client currentClient = db.Clients.FirstOrDefault(c => c.Email == client.Email);

            //Добавляем новую запись в бд
            db.Recordings.Add( new Recording { MasterId = record.MasterId, ClientId = currentClient.Id, ServiceId = record.ServiceId, DateTime_of_recording = record.DateTime_of_recording, Comment = record.Comment } );
            //Обновляем бд
            db.SaveChanges();


            IQueryable<Master> masters = db.Masters;

            return View(masters.ToList());
        }

        //Запрос прилетает из service.js
        public List<Service> GetServises(int masterId)
        {
            //Получаем все сервисы мастера
            IQueryable<Service> currentServices = (from s in db.Services
                                                   where (s.MasterId == masterId)
                                                   select s);
            //Передаем их в представление
            return currentServices.ToList();
        }
    }
}

    

