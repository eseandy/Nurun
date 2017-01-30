using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Clases;
using Datos;

namespace Negocio
{
    public static class transferenciaBs
    {
        /// <summary>
        /// Nueva transferencia, utiliza Libreria de Clasess de Acceso a Datos
        /// </summary>
        /// <param name="id_user"></param>
        /// <param name="id_client"></param>
        /// <param name="amount"></param>
        /// <param name="desc_tran"></param>
        /// <returns></returns>
        public static int NewTran(int id_user, int id_client, float amount, string desc_tran)
        {
            return transferenciaDAL.newTrans(id_user, id_client, amount, desc_tran);
        }

    }
}
