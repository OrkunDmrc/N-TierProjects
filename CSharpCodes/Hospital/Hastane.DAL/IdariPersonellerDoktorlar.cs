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
    
    public partial class IdariPersonellerDoktorlar
    {
        public int IdariPersonelId { get; set; }
        public int DoktorId { get; set; }
        public bool Durum { get; set; }
    
        public virtual Doktorlar Doktorlar { get; set; }
        public virtual IdariPersonel IdariPersonel { get; set; }
    }
}
