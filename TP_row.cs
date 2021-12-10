using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using MySql.Data.MySqlClient;


public partial class TTP_Chart : System.Web.UI.Page
{    

    MySqlConnection mycon;
    MySqlDataAdapter myada;

    protected void Page_Load(object sender, EventArgs e) 
    {      
            bind_header();
            bind_mesdata();
            bind_tpdata();   
                  
    }
    protected void bind_header()     //顯示對應詳細資料
    {
            
            string sql_stm = "";
        
            DataTable dt = new DataTable();
            
            sql_stm = "SELECT  DISTINCT DATE_FORMAT(date, '%Y/%m/%d') as date, op_id, eqp_id, sheet_id, model_no, csv_name FROM l8bi0.l8b_ary_spc_ttp_csv_xy_value  WHERE csv_name = '" + Request["csv_name"] + "' ";

            mycon = new MySqlConnection(System.Configuration.ConfigurationSettings.AppSettings["L8BI0_MySQL"]);
            mycon.Open();
            myada = new MySqlDataAdapter(sql_stm, mycon);
            myada.Fill(dt);
            mycon.Close();
            Header_Data.DataSource = dt;
            Header_Data.DataBind();

    }
    protected void bind_mesdata()    //顯示對應rowdata
    {        
           
            string sql_stm = "";
        
            DataTable dt = new DataTable();
            
            sql_stm = "SELECT d.mes_no, c.mes_sort, c.chip_id, c.chip_no, d.des_x, d.des_y, xy.x_val, xy.y_val ";
            sql_stm = sql_stm + " FROM l8bi0.l8b_ary_spc_ttp_csv_map_design d, l8bi0.l8b_ary_spc_ttp_csv_chip c, l8bi0.l8b_ary_spc_ttp_csv_xy_value xy ";
            sql_stm = sql_stm + " WHERE d.mes_no = c.mes_no ";
            sql_stm = sql_stm + " and d.mes_no = xy.no ";
            sql_stm = sql_stm + " and d.model = xy.model ";
            sql_stm = sql_stm + " and c.model = xy.model ";
            sql_stm = sql_stm + " and xy.csv_name = '" + Request["csv_name"] + "' ";
            sql_stm = sql_stm + " ORDER BY  c.chip_no, c.mes_sort ASC; ";
            
            mycon = new MySqlConnection(System.Configuration.ConfigurationSettings.AppSettings["L8BI0_MySQL"]);
            mycon.Open();
            myada = new MySqlDataAdapter(sql_stm, mycon);
            myada.Fill(dt);
            mycon.Close();
            Mes_Data.DataSource = dt;
            Mes_Data.DataBind();

    }
    protected void bind_tpdata()    //顯示對應TP值
    {
            
            string sql_stm = "";
            

        
            DataTable dt = new DataTable();
            
            sql_stm = "SELECT tp, tp_val FROM l8bi0.l8b_ary_spc_ttp_tp_value WHERE csv_name = '" + Request["csv_name"] + "' ";
            

            mycon = new MySqlConnection(System.Configuration.ConfigurationSettings.AppSettings["L8BI0_MySQL"]);
            mycon.Open();
            myada = new MySqlDataAdapter(sql_stm, mycon);
            myada.Fill(dt);
          
            mycon.Close();
            TP_Data.DataSource = dt;
            TP_Data.DataBind();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                string tp_val = TP_Data.Rows[i].Cells[1].Text;
                float tp = float.Parse(tp_val); 
                if (tp >-4.5 || tp < -11.5) 
                {
                    TP_Data.Rows[i].Cells[1].BackColor = System.Drawing.Color.Pink;
                } 
            }
            
    }

    


           
           
          

     
}
