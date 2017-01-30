using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Clases;
using Datos;

namespace Negocio
{
    public static class userBs
    {
        /// <summary>
        /// Login usuario
        /// </summary>
        /// <param name="_user"></param>
        /// <param name="_pass"></param>
        /// <returns></returns>
        public static user GetLogin(string _user, string _pass) {
            return userDAL.GetLogin(_user, _pass);
        }


    }
}
