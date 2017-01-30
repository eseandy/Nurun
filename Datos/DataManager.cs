using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Datos
{
    public class DataManager
    {
        public string query;
        /// <summary>
        /// Se realizan las operaciones con BD
        /// </summary>
        public DataManager()
        {
            query = "";
        }

        public DataTable ExecuteDatatableSql(string query, SqlParameter[] para)
        {
            Coneccion.Connection("");
            DataTable dt = Coneccion.ExecuteDatatable(CommandType.Text, query, para);
            Coneccion.Close();
            return dt;
        }

        public DataSet ExecuteDatasetSql(string query, SqlParameter[] para)
        {
            Coneccion.Connection("");
            DataSet dt = Coneccion.ExecuteDataset(CommandType.Text, query, para);
            Coneccion.Close();
            return dt;
        }

        public object ExecuteScalarSql(string query, SqlParameter[] para)
        {
            Coneccion.Connection("");
            object dt = Coneccion.ExecuteScalar(CommandType.Text, query, para);
            Coneccion.Close();
            return dt;
        }

        public int ExecuteNonQuerySql(string query)
        {
            Coneccion.Connection("");
            int dt = Coneccion.ExecuteNonQuery(CommandType.Text, query);
            Coneccion.Close();
            return dt;
        }

        public int ExecuteNonQuerySql(string query, SqlParameter[] parametersCollection)
        {
            Coneccion.Connection("");
            int dt = Coneccion.ExecuteNonQuery(CommandType.Text, query, parametersCollection);
            Coneccion.Close();
            return dt;
        }

        public DataTable ExecuteDatatableSqlSinParam(string query)
        {
            Coneccion.Connection("");
            DataTable dt = Coneccion.ExecuteDatatable(CommandType.Text, query);
            Coneccion.Close();
            return dt;
        }

        public object ExecuteScalarSinParms(string query)
        {
            Coneccion.Connection("");
            object dt = Coneccion.ExecuteScalarSinParms(CommandType.Text, query);
            Coneccion.Close();
            return dt;
        }
        public object ExecuteScalar(string query, SqlParameter[] para)
        {
            Coneccion.Connection("");
            object dt = Coneccion.ExecuteScalarSinParms(CommandType.Text, query, para);
            Coneccion.Close();
            return dt;
        }
    }
}