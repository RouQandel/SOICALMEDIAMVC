﻿using DataAccess_Layer_Database.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess_Layer_Database.Configuration
{
    public class PostTagConfiguration : IEntityTypeConfiguration<PostTag>
    {
        public void Configure(EntityTypeBuilder<PostTag> builder)
        {
            builder.HasKey(pt => new { pt.PostId, pt.TagId});

            builder.HasOne(p => p.Post)
                .WithMany(pt => pt.PostTags)
                .HasForeignKey(p => p.PostId);

            builder.HasOne(t => t.Tag)
                .WithMany(pt => pt.PostTags)
                .HasForeignKey(t => t.TagId);


        }
    }
}
