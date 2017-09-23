<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="WebApplication1.login" %>

<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title>Day01</title>
    <script src="js/vue/2.4.2/vue.js"></script>
    <script src="js/elementui/1.4.3/index.js"></script>
    <link rel="stylesheet" href="js/elementui/1.4.3/theme-default/index.css">
</head>
<body>

<div id="login">
    <el-dialog title="登录系统" :visible.sync="dialogFormVisible" size="tiny">
        <el-form :model="form"   method="post" action="login.aspx" >
            <el-form-item label="账号" :label-width="formLabelWidth"  >
                <el-input name="name" placeholder="请输入账号" v-model="form.name" auto-complete="off">
                    <template slot="prepend"><i class="el-icon-star-off"></i></template>
                </el-input>
            </el-form-item>
            <el-form-item label="密码" :label-width="formLabelWidth">
                <el-input  name="password" placeholder="请输入密码" type="password" v-model="form.password" name="password">
                    <template slot="prepend"><i class="el-icon-star-off"></i></template>
                </el-input>
            </el-form-item>
            <el-input type="submit"     style="margin: 0 auto; display: block;">登录</el-input>
        </el-form>
    </el-dialog>
</div>

<script>
    new Vue({
        el: '#login',
        data: function () {
            return {
                dialogFormVisible: true,
                form: {},
                formLabelWidth: '100px'
            }
        }
    })
</script>
</body>
</html>
