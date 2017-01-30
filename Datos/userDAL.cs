using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using Clases;

namespace Datos
{
    public static class userDAL
    {
        /// <summary>
        /// Consulta en BD el usuario existente
        /// </summary>
        /// <param name="User"></param>
        /// <param name="Password"></param>
        /// <returns></returns>
        public static user GetLogin(string User, string Password)
        {
            user usr = null;
            DataManager dm = new DataManager();
            //AOL: Scan "binary"
            string qry = @"exec sp_login @user, @pass";
            try
            {
                SqlParameter[] sqlParams = new SqlParameter[2];

                sqlParams[0] = new SqlParameter("@user", SqlDbType.VarChar);
                sqlParams[0].Value = User;
                sqlParams[1] = new SqlParameter("@pass", SqlDbType.VarChar);
                sqlParams[1].Value = Password;

                DataTable data = dm.ExecuteDatatableSql(qry, sqlParams);
                DataTableReader dr = new DataTableReader(data);

                if (dr.FieldCount > 0)
                {
                    while (dr.Read())
                    {
                        usr = LoadUser(dr);
                    }
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }

            return usr;
        }

        public static user LoadUser(IDataReader dr)
        {
            user usr = new user();

            usr.id_user = Convert.ToInt64(dr["id_user"]);
            usr.name_user = Convert.ToString(dr["name_user"]);
            usr.rol_user = Convert.ToInt64(dr["rol_user"]);

            return usr;
        }


    }
}
