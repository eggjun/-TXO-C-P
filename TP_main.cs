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


public partial class TTP : System.Web.UI.Page
{    

    MySqlConnection mycon;
    MySqlDataAdapter myada;

    protected void Page_Load(object sender, EventArgs e) 
    {
        show_data();
    }
    protected void show_data(){     //載入頁面時顯示最近一天的資料

            string sql_stm1 = "", htmlStr1 = "";
        
            DataTable dt1 = new DataTable();
            
            sql_stm1 = "SELECT DATE_FORMAT(date_time,'%Y/%m/%d') as date, csv_name, model FROM l8bi0.l8b_ary_spc_ttp_csv WHERE date_time > DATE_SUB(curdate(), INTERVAL 2 DAY) ";           

            sql_stm1 = sql_stm1 + "  ORDER BY date_time DESC ";

           
            mycon = new MySqlConnection(System.Configuration.ConfigurationSettings.AppSettings["L8BI0_MySQL"]);
            mycon.Open();
            myada = new MySqlDataAdapter(sql_stm1, mycon);
            myada.Fill(dt1);
            mycon.Close();
            GridView1.DataSource = dt1;
            GridView1.DataBind();
            for (int i = 0; i < dt1.Rows.Count; i++)
            {
                htmlStr1 = "http://tw100018629/L8BI0/I1_RPT/TTP/TTP_Chart.aspx?csv_name=" + GridView1.Rows[i].Cells[1].Text;
                GridView1.Rows[i].Cells[1].Text = "<a href='" + htmlStr1 + "'target='_blank'>" + GridView1.Rows[i].Cells[1].Text + "</a>";      //網址做超連結處理  
            }


    }
    protected void btn1_click(object sender, EventArgs e) //點擊查詢按鈕後進行模糊查詢
    {  
       
            string sql_stm = "", htmlStr = "";
        
            DataTable dt = new DataTable();
            
            sql_stm = "SELECT DATE_FORMAT(date_time,'%Y/%m/%d') as date, csv_name, model FROM l8bi0.l8b_ary_spc_ttp_csv WHERE 1=1 ";

            if (tb1.Text.ToString() != ""){
                    sql_stm = sql_stm + " and (model like upper('%" +tb1.Text.ToString()+ "%') or model like lower('%" +tb1.Text.ToString()+ "%'))";
                }

            if (tb2_date.Text.ToString() != ""){
                    sql_stm = sql_stm + "  and date_time = '" +tb2_date.Text.ToString()+ "' ";
                }

            sql_stm = sql_stm + "  ORDER BY date_time DESC ";
           
            mycon = new MySqlConnection(System.Configuration.ConfigurationSettings.AppSettings["L8BI0_MySQL"]);
            mycon.Open();
            myada = new MySqlDataAdapter(sql_stm, mycon);
            myada.Fill(dt);
            mycon.Close();
            GridView1.DataSource = dt;
            GridView1.DataBind();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                htmlStr = "http://tw100018629/L8BI0/I1_RPT/TTP/TTP_Chart.aspx?csv_name=" + GridView1.Rows[i].Cells[1].Text;
                GridView1.Rows[i].Cells[1].Text = "<a href='" + htmlStr + "'target='_blank'>" + GridView1.Rows[i].Cells[1].Text + "</a>";      //網址做超連結處理  
            }
            
    }
        
          

     
}
