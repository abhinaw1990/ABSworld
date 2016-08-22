using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ArtpieceShopping.Models
{
    public class Product
    {
        public string Code { get; set; }
        public string Name { get; set; }
        public double Price { get; set; }
        public string Availability { get; set; }
        public string ImageBig { get; set; }
        public string ImageSmall { get; set; }
        public bool CartAdded { get; set; }
    }
}