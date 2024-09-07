﻿using Business_Layer_MindOfSolution.DTOs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business_Layer_MindOfSolution
{
    public interface IUserService
    {
        UserDTO CreateUser(UserDTO userDTO);
        UserDTO UpdatedUser (UserDTO userDTO);
        bool DeleteUser(int userid);
        UserDTO GetUserById(int userId);
        List<UserDTO> GetAllUser();
        UserDTO Login(string email, string password);
        UserDTO Register(UserDTO userDTO);
        List<UserDTO> SearchUsers(string searchTerm);
        string HashPassword(string password);
    }

}
