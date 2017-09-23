using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class index : System.Web.UI.Page
    {
        public int totalpagecount = 1;
        public int responsepageindex = 1;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Request.HttpMethod == "GET")
            {
                return;
            }
            string username = Request.Form["username"];
            string sex = Request.Form["sex"];

            string classnum = Request.Form["classnum"];
            
            bool? b_sex = null;
            if (!string.IsNullOrEmpty(sex))
            {
                if (sex == "女")
                {
                    b_sex = true;
                }
                else
                {
                    b_sex = false;
                }
            }
            czy_dbEntities theEntity = new czy_dbEntities();
            String firstbtn = Request.Form["firstbtn"];
            String prebtn = Request.Form["prebtn"];
            String nextbtn = Request.Form["nextbtn"];
            String endbtn = Request.Form["endbtn"];
            String gobtn = Request.Form["gobtn"];
            String currentpagebtn = Request.Form["currentpageindex"];


            int wantpage = 1;
            if (null != Request.Form["currentpageindex"])
            { wantpage = Int32.Parse(currentpagebtn); }

            int total =
               (from onestudent in theEntity.study_students
                join oneclass in theEntity.study_class
                 on onestudent.class_id equals oneclass.id
                select onestudent
               ).Count();

          
            int totalpage = total / 5;
            if (total % 5 != 0)
            { totalpage++; }
            totalpagecount = totalpage;
            if (!String.IsNullOrEmpty(firstbtn))
            {
                wantpage = 1;

            }
            else if (!String.IsNullOrEmpty(prebtn))
            {
                wantpage--;
                if (wantpage <= 0)
                { wantpage = 1; }
            }
            else if (!String.IsNullOrEmpty(nextbtn))
            {
                wantpage++;
                if (wantpage > totalpage)
                { wantpage = totalpage; }
            }
            else if (!String.IsNullOrEmpty(endbtn))
            {
                wantpage = totalpage;

            }
            else if (!String.IsNullOrEmpty(gobtn))
            {
                
                if (wantpage > totalpage)
                { wantpage = totalpage; }
            }





            IQueryable<object> rtv =
                 (from oneStudent in theEntity.study_students
                  join oneClass in theEntity.study_class
                  on oneStudent.class_id equals oneClass.id
                  where (string.IsNullOrEmpty(username) ? true : oneStudent.name.Equals(username)) &&
                     (b_sex.Equals(null) ? true : oneStudent.sex.Equals(b_sex.Value)) &&
                     (string.IsNullOrEmpty(classnum) ? true : oneClass.name.Equals(classnum))
                  select new
                  {
                      studentid = oneStudent.id,
                      name = oneStudent.name,
                      sex = oneStudent.sex,
                      banji= oneClass.name,
                  }).OrderBy(theKey => theKey.studentid).Skip((wantpage - 1) * 5).Take(5);
            ViewState["data"] = rtv.ToList();
            responsepageindex = wantpage;



        }
    }
}