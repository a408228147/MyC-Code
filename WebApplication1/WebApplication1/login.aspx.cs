using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string username = Request.Form["name"];
            string password = Request.Form["password"];
            czy_dbEntities theEntity = new czy_dbEntities();

            IQueryable<study_students> rtv =
                from oneStudent in theEntity.study_students
                where oneStudent.name.Equals(username) &&
                      oneStudent.password.Equals(password)
                select oneStudent;
            if (rtv.Count() < 1)
            {
                //
            }
            else
            {
                Response.Redirect("index.aspx");
            }

        }
    }
}