﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess_Layer_Database.Entities
{
    [Table("Comments")]
    public class Comment
    {
        [Key]
        public int CommentId { get; set; }

        [ForeignKey(nameof(User))]
        public int UserId { get; set; }
        public string Message { get; set; }
        public DateTime Date { get; set; } = DateTime.Now;

        [ForeignKey(nameof(Posts))]
        public int PostId { get; set; }

        //Navigation Property
        public User user{ get; set; }
        public Posts Posts { get; set; }
       

       
    }
}
