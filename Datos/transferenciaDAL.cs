using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Clases;

namespace Datos
{
    public static class transferenciaDAL
    {
        /// <summary>
        /// Inserta en BD Transferencias
        /// </summary>
        /// <param name="id_user"></param>
        /// <param name="id_client"></param>
        /// <param name="amount"></param>
        /// <param name="desc_tran"></param>
        /// <returns></returns>
        public static int newTrans(int id_user, int id_client, float amount, string desc_tran)
        {
            int newId = 0;
            DataManager dm = new DataManager();
            //AOL: Scan "binary"
            string qry = @"exec sp_insert_tran @id_user,@id_client,@amount,@desc_tran";
            try
            {
                SqlParameter[] sqlParams = new SqlParameter[4];

                sqlParams[0] = new SqlParameter("@id_user", SqlDbType.Int);
                sqlParams[0].Value = id_user;
                sqlParams[1] = new SqlParameter("@id_client", SqlDbType.Int);
                sqlParams[1].Value = id_client;
                sqlParams[2] = new SqlParameter("@amount", SqlDbType.Float);
                sqlParams[2].Value = amount;
                sqlParams[3] = new SqlParameter("@desc_tran", SqlDbType.VarChar);
                sqlParams[3].Value = desc_tran;

                DataTable data = dm.ExecuteDatatableSql(qry, sqlParams);
                DataTableReader dr = new DataTableReader(data);

                if (dr.FieldCount > 0)
                {
                    while (dr.Read())
                    {
                        newId = Convert.ToInt32(dr[0]);
                    }
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }

            return newId;
        }
    }
}
