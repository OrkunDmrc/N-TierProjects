//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Hastane.DAL
{
    using System;
    using System.Collections.Generic;
    
    public partial class Personeller
    {
        public int PersonelId { get; set; }
        public int BolumId { get; set; }
        public string PersonelAdi { get; set; }
        public string PersonelSoyadi { get; set; }
        public System.DateTime PersonelDogumTarihi { get; set; }
        public string PersonelAdresi { get; set; }
        public string PersonelTel { get; set; }
        public bool Durum { get; set; }
    
        public virtual Bolumler Bolumler { get; set; }
    }
}
