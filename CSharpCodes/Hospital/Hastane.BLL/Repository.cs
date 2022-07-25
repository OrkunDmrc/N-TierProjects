using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Hastane.DAL;

namespace Hastane.BLL
{
    public class Repository<T> : IRepository<T> where T : class
    {
        HastaneDBEntities db = new HastaneDBEntities();
        public void Delete(int itemId)
        {
            db.Set<T>().Remove(db.Set<T>().Find(itemId));
            db.SaveChanges();
        }

        public List<T> GetAll()
        {
            return db.Set<T>().ToList();
        }

        public T GetById(int itemId)
        {
            return db.Set<T>().Find(itemId);
        }

        public void Insert(T item)
        {
            db.Set<T>().Add(item);
            db.SaveChanges();
        }

        public void Update(T item)
        {
            db.Set<T>().Attach(item);
            db.Entry(item).State = EntityState.Modified;
            db.SaveChanges();
        }
    }
}
