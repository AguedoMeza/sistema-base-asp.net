<%@ Page Title="" Language="C#" MasterPageFile="~/master_pages/login.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login_login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title" align="center">Ingrese su cuenta</h3>
                    </div>
                    <div class="panel-body">
                        <form role="form">
                            <fieldset>
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox1" class="form-control" placeholder="E-mail" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox2" class="form-control" placeholder="Password" runat="server" type="password"></asp:TextBox>
                                </div>
                                <div class="checkbox">
                                    <label>
                                      <%--  <input name="remember" type="checkbox" value="Remember Me">Remember Me--%>
                                    </label>
                                    <asp:Label ID="Label1" runat="server"></asp:Label>
                                </div>
                                <!-- Change this to a button or input when using this as a form -->
                              <%--  <a href="index.html" class="btn btn-lg btn-success btn-block">Login</a>--%>
                                <asp:Button ID="Button1"  class="btn btn-lg btn-success btn-block" runat="server" Text="Login" OnClick="Button1_Click" />
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
     </div>
     
     <%--C:\Users\Aguedo\Documents\Visual Studio 2013\Projects\ProjectBase\ProjectBseBusiness\Class1.vb--%>
     
</asp:Content>

