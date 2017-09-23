using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class _interface : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //            Response.Write(@"[
            // {
            //    ""name"": ""55555"",
            //    ""value"": 1
            //  },
            //  {
            //    ""name"": ""44444"",
            //    ""value"": 5555
            //  }]

            //");
           
                czy_dbEntities theEntity = new czy_dbEntities();
                IQueryable<object> rtv =
                  (from oneclass in theEntity.study_class
                   select new
                   {
                       value = oneclass.name,
                       name = oneclass.id
                   });

                JavaScriptSerializer jss = new JavaScriptSerializer();
                string jsonstr = jss.Serialize(rtv.ToList());
                Response.Write(jsonstr);
            

        }
    }
}