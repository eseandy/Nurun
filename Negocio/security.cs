using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Security.Cryptography;

namespace Negocio
{
    public class security
    {
        /// <summary>
        /// Convierte a SHA1 las cadenas
        /// </summary>
        /// <param name="literal"></param>
        /// <returns></returns>
        public static string SHA1(string literal)
        {
            byte[] bytes = Encoding.UTF8.GetBytes(literal);
            SHA256Managed hashstring = new SHA256Managed();
            byte[] hash = hashstring.ComputeHash(bytes);
            string hashString = string.Empty;
            foreach (byte x in hash) { hashString += String.Format("{0:x2}", x); }
            return hashString;
        }
    }
}
