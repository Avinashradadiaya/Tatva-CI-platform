using category.Data;
using category.Models;
using Microsoft.AspNetCore.Mvc;

namespace category.Controllers
{
    public class CategoryController : Controller
    {

        private readonly ApplicationDbContext _db;


        public CategoryController(ApplicationDbContext db)
        {
            _db = db;
        }

        public IActionResult Index()
        {
            IEnumerable<Category> objCategories = _db.Category;
            return View(objCategories);
        }

        //GET
        public IActionResult Create()
        {
           
            return View();
        }
        
        //POST
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Create(Category obj)
        {
            if(obj.name == obj.DisplayOrder.ToString())
            {
                ModelState.AddModelError("name", "The DisplayOrder cannot exactly match the Name.");
            }
            if (ModelState.IsValid)
            {
                _db.Category.Add(obj);
                _db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(obj);
            
        }
        //GET
        public IActionResult Edit( int? id)
        {
            if(id==null || id==0){
                return NotFound();
            }
            var categoryFromDb = _db.Category.Find(id);
            //var CategoryFromDbFirst = _db.Categories.FirstOrDefault(u=>u.Id==id);
            //var CategoryFromDbSingle = _db.Categories.SingleOrDefault(u=>u.Id==id);

            if (categoryFromDb == null) 
            {
                return NotFound();
            }

            return View(categoryFromDb);
        }

        //POST
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Edit(Category obj)
        {
            if (obj.name == obj.DisplayOrder.ToString())
            {
                ModelState.AddModelError("name", "The DisplayOrder cannot exactly match the Name.");
            }
            if (ModelState.IsValid)
            {
                _db.Category.Add(obj);
                _db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(obj);

        }
    }
}


