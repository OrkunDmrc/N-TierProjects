﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Katmanli.DAL
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class XStoreDBEntities : DbContext
    {
        public XStoreDBEntities()
            : base("name=XStoreDBEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Bolumler> Bolumlers { get; set; }
        public virtual DbSet<Markalar> Markalars { get; set; }
        public virtual DbSet<Musteriler> Musterilers { get; set; }
        public virtual DbSet<Personeller> Personellers { get; set; }
        public virtual DbSet<SiparisDetaylari> SiparisDetaylaris { get; set; }
        public virtual DbSet<Siparisler> Siparislers { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }
        public virtual DbSet<Tedarikciler> Tedarikcilers { get; set; }
        public virtual DbSet<Urunler> Urunlers { get; set; }
    }
}
