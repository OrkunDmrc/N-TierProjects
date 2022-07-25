using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hastane.BLL
{
    public interface IRepository<T>
    {
        T GetById(int itemId);
        List<T> GetAll();
        void Insert(T item);
        void Update(T item);
        void Delete(int itemId);
    }
}
