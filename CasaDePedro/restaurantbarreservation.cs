//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CasaDePedro
{
    using System;
    using System.Collections.Generic;
    
    public partial class restaurantbarreservation
    {
        public int Id { get; set; }
        public Nullable<System.DateTime> StartDateTime { get; set; }
        public Nullable<System.DateTime> EndDateTime { get; set; }
        public Nullable<short> NoOfPerson { get; set; }
        public Nullable<sbyte> HotelId { get; set; }
        public Nullable<sbyte> RestaurantBarVenueId { get; set; }
        public string FullName { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public string Comment { get; set; }
        public Nullable<bool> BookingConfirmed { get; set; }
        public string ConfirmedBy { get; set; }
    
        public virtual restaurantbarvenue restaurantbarvenue { get; set; }
        public virtual hotel hotel { get; set; }
    }
}
