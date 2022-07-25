using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Repository
{
  public interface IRepositorycs<T>
    {
        void Insert(T item);
        void Update(T item);
        void Delete(int itemId);
        List<T> GetAll();
        T Get(int itemId);
    }
}
