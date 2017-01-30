using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Datos
{
    public class Coneccion
    {
        protected static SqlConnection MyConn = null;
        /// <summary>
        /// Conecta BD
        /// </summary>
        /// <param name="ConnectionString"></param>
        public static void Connection(string ConnectionString)
        {
            string sConnection = string.Empty;

            if (ConnectionString == "")
            {
                sConnection = ConfigurationManager.ConnectionStrings["SQLConnection"].ToString();

            }
            else
            {
                sConnection = ConnectionString;
            }

            try
            {
                if (MyConn == null || MyConn.State == ConnectionState.Closed) 
                {
                    MyConn = new SqlConnection(sConnection);
                    MyConn.Open();
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static void Close()
        {

            try
            {
                MyConn.Close();
                MyConn.Dispose();
                MyConn = null;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private static void AttachParameters(SqlCommand command, SqlParameter[] commandParameters)
        {
            if (command == null) throw new ArgumentNullException("command");
            if (commandParameters != null)
            {
                foreach (SqlParameter p in commandParameters)
                {
                    if (p != null)
                    {
                        try
                        {
                            if ((p.Direction == ParameterDirection.InputOutput ||
                                p.Direction == ParameterDirection.Input) && (p.Value == null))
                            {
                                p.Value = DBNull.Value;
                            }
                            command.Parameters.Add(p);
                        }
                        catch (Exception ex)
                        {
                            throw ex;
                        }
                    }
                }
            }
        }

        private static void PrepareCommand(SqlCommand command, SqlConnection connection, CommandType commandType, string commandText,
        SqlParameter[] commandParameters)
        {
            if (command == null) throw new ArgumentNullException("command");
            if (commandText == null || commandText.Length == 0) throw new ArgumentNullException("commandText");

            try
            {
                command.Connection = connection;
                command.CommandText = commandText;
                command.CommandType = commandType;

                if (commandParameters != null)
                {
                    AttachParameters(command, commandParameters);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return;
        }

        public static DataSet ExecuteDataset(CommandType commandType, string commandText)
        {
            return ExecuteDataset(commandType, commandText, (SqlParameter[])null);
        }

        public static DataSet ExecuteDataset(CommandType commandType, string commandText, params SqlParameter[] commandParameters)
        {
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();

            try
            {
                SqlCommand cmd = new SqlCommand();

                PrepareCommand(cmd, MyConn, commandType, commandText, commandParameters);

                SqlDataAdapter da = new SqlDataAdapter(cmd);

                da.Fill(ds);
                cmd.Parameters.Clear();

            }
            catch (SqlException ex)
            {
                throw ex;
            }

            return ds;
        }

        public static DataTable ExecuteDatatable(CommandType commandType, string commandText)
        {
            return ExecuteDatatable(commandType, commandText, (SqlParameter[])null);
        }

        public static DataTable ExecuteDatatable(CommandType commandType, string commandText, params SqlParameter[] commandParameters)
        {
            DataTable dt = new DataTable();

            try
            {
                SqlCommand cmd = new SqlCommand();

                PrepareCommand(cmd, MyConn, commandType, commandText, commandParameters);

                SqlDataAdapter da = new SqlDataAdapter(cmd);

                da.Fill(dt);
                cmd.Parameters.Clear();

            }
            catch (SqlException ex)
            {
                throw ex;
            }

            return dt;
        }

        public static object ExecuteScalar(CommandType commandType, string commandText)
        {
            return ExecuteScalar(commandType, commandText, (SqlParameter[])null);
        }

        public static object ExecuteScalar(CommandType commandType, string commandText, params SqlParameter[] commandParameters)
        {

            object retval = null;

            try
            {
                SqlCommand cmd = new SqlCommand();
                PrepareCommand(cmd, MyConn, commandType, commandText, commandParameters);


                retval = cmd.ExecuteScalar();
                cmd.Parameters.Clear();
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return retval;
        }

        public static object ExecuteScalarSinParms(CommandType commandType, string commandText)
        {
            return ExecuteScalar(commandType, commandText, (SqlParameter[])null);
        }

        public static object ExecuteScalarSinParms(CommandType commandType, string commandText, params SqlParameter[] commandParameters)
        {

            object retval = null;

            try
            {
                SqlCommand cmd = new SqlCommand();
                PrepareCommand(cmd, MyConn, commandType, commandText, commandParameters);


                retval = cmd.ExecuteScalar();
                //cmd.Parameters.Clear();
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return retval;
        }

        public static int ExecuteNonQuery(CommandType commandType, string commandText)
        {
            return ExecuteNonQuery(commandType, commandText, (SqlParameter[])null);
        }

        public static int ExecuteNonQuery(CommandType commandType, string commandText, params SqlParameter[] commandParameters)
        {

            int retval = 0;
            try
            {

                SqlCommand cmd = new SqlCommand();

                PrepareCommand(cmd, MyConn, commandType, commandText, commandParameters);
                retval = cmd.ExecuteNonQuery();
                cmd.Parameters.Clear();
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return retval;
        }
    }
}