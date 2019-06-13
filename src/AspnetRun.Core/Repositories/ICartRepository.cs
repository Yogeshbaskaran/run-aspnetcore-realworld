﻿using AspnetRun.Core.Entities;
using AspnetRun.Core.Repositories.Base;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace AspnetRun.Core.Repositories
{
    public interface ICartRepository : IRepository<Cart>
    {
        Task<Cart> GetByUserNameAsync(string userName);
    }
}
