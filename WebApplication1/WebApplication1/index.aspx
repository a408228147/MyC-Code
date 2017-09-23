<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="WebApplication1.index" %>

<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title>Day01</title>
    <script src="js/vue/2.4.2/vue.js"></script>
    <script src="js/elementui/1.4.3/index.js"></script>
    <script src="js/jquery/jquery-3.2.1.min.js"></script>
    <link rel="stylesheet" href="js/elementui/1.4.3/theme-default/index.css">
</head>

<body lang="en">
<div id="index">
  
    
 <el-form :inline="true" :model="formInline" class="demo-form-inline" action ="index.aspx" method="post">

    
        <el-form-item label="姓名">
            <el-input v-model="formInline.name" placeholder="姓名" name ="username"   ></el-input>
         </el-form-item>

        <el-form-item label="性别">
            <el-select v-model="formInline.sex" placeholder="性别"  name="sex" :clearable="true">
                <el-option label="男" value="true"></el-option>
                <el-option label="女" value="false"></el-option>
            </el-select>
        </el-form-item>


          <el-form-item label="班级">
              <el-select v-model="formInline.clazz" placeholder="班级"  name="classnum" :clearable="true">
                <el-option v-for="item in clas" :value="item.value"  :label ="item.value">
                </el-option>
             </el-select>
          </el-form-item>
        <el-form-item>
              <el-button type="primary"  native-type="submit"  >查询</el-button>
         </el-form-item>
    </el-form>
     

   
      <%--  <el-table
                :data="tableData"
                style="width: 100%">
            <el-table-column
                    prop="num"
                    label="学号"
                    width="180">
            </el-table-column>
            <el-table-column
                    prop="name"
                    label="姓名"
                    width="180">
            </el-table-column>
            <el-table-column
                    prop="sex"
                    label="性别">
            </el-table-column>
            <el-table-column
                    prop="classnum"
                    label="班级"
                    width="180">
            </el-table-column>
        </el-table>--%>
         
        <table>
        <tr>
            <th>学号</th>
            <th>姓名</th>
            <th>性别</th>
            <th>班级</th>
        </tr>
           <%if (null != ViewState["data"])
                   { %>
        <% 
                   foreach (object item in (ViewState["data"] as List<object>))
                   {
        %>
        <tr>
            <td><% Response.Write(item.GetType().GetProperty("studentid").GetValue(item, null));%></td>
            <td><% Response.Write(item.GetType().GetProperty("name").GetValue(item, null));%></td>
            <td><% Response.Write(item.GetType().GetProperty("sex").GetValue(item, null));%></td>
            <td><% Response.Write(item.GetType().GetProperty("banji").GetValue(item, null));%></td>
        </tr>
        <%
                       }
                   }
        %>
    </table>
  
    <form method ="post"  action="index.aspx">
        <input type="submit" name="firstbtn" value="第一页" />
        <input type="submit" name="prebtn" value="上一页" />
        <input type="submit" name="nextbtn" value="下一页" />
        <input type="submit" name="endbtn" value="最后一页" />
        <input type="submit" name="gobtn" value="到" />
        <input type="text" name="currentpageindex" value="<%=this.responsepageindex %>" />/
        <label><%=this.totalpagecount %></label>
        <label>页</label>
    </form>
      
 
   
</div>



    <script type="text/javascript">


        var requestDatas = new Object();
       


        jQuery.ajax({
            url: '/interface.aspx',
            type: 'post',
            data: requestDatas,
            dataType: 'json',
            async: true,
            success: function (data, textStatus) {
                if ("success" == textStatus) {
                    for (var i = 0; i < data.length; i++) {
                        da.clas = data;
             
                    }
                }
                else {
                    alert(textStatus);
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert(errorThrown);
            }
        });


    </script>

    <script>
        var da = new Vue({
            el: '#index',
            data: function () {
                return {
                    clas: [],
                    formInline: {
                        username: '',
                        sex: '',
                        classnum: '',
                        clazz: ''
                    },
                }
            }

        
        
    })
        
</script>

</body>
</html>