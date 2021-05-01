using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using tm_frontend.Models;

namespace tm_frontend.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        public IActionResult Index()
        {
            Console.WriteLine("Login page");
            return View();
        }

        [HttpPost]
        public IActionResult Index(string username, string password)
        {
            Console.WriteLine("Login page (Post)");
            Console.WriteLine("username=" + username);
            Console.WriteLine("password=" + password);
            if ("user1".Equals(username) && "1234".Equals(password))
            {
                Console.WriteLine("Logged on with user1");
                return View("Page1");
            }
            else if ("user2".Equals(username) && "1234".Equals(password))
            {
                Console.WriteLine("Logged on with user2");
                return View("Page2");
            }
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
