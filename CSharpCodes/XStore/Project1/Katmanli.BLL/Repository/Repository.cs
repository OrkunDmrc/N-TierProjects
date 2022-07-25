﻿using Katmanli.DAL;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Katmanli.BLL.Repository
{
    
    public class Repository<T> : IRepository<T> where T : class
    {
        XStoreDBEntities db = new XStoreDBEntities();

        public void Insert(T item)
        {
            db.Set<T>().Add(item);
            db.SaveChanges();
        }
        public void Delete(int itemId)
        {
            T deleted = db.Set<T>().Find(itemId);
            db.Set<T>().Remove(deleted);
            db.SaveChanges(); 
        }
        
        public T Get(int itemId)
        {
            return db.Set<T>().Find(itemId);
        }

        public List<T> GetAll()
        {
            return db.Set<T>().ToList();
        }

      

        public void Update(T item)
        {
            db.Set<T>().Attach(item);
            db.Entry(item).State = EntityState.Modified;
            db.SaveChanges();
        }
    }
}
