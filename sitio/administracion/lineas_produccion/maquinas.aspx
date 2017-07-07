<%@ Page Title="" Language="C#" MasterPageFile="~/master_pages/MasterPage.master" AutoEventWireup="true" CodeFile="maquinas.aspx.cs" Inherits="administracion_lineas_produccion_maquinas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <style>
.row li {
  width: 10%;
  float: left;
}

ul{
    list-style:none;
  }

img {
 
}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1 class="page-header" >Línea de producción: Polvos</h1>
  
    <ul>
          <li id="li1" runat="server" title="1">
        <img src="icono.png" class="img-responsive inline-block" alt="Responsive image" />
      </li>
       <li id="li2" runat="server" title="1">
        <img src="icono.png" class="img-responsive inline-block" alt="Responsive image" />
      </li>
     <li id="li3" runat="server" title="1">
        <img src="icono.png" class="img-responsive inline-block" alt="Responsive image" />
      </li>
       <li id="li4" runat="server" title="1">
        <img src="icono.png" class="img-responsive inline-block" alt="Responsive image" />
      </li>
      <li id="li5" runat="server" title="1">
        <img src="flecha.png" class="img-responsive inline-block" alt="Responsive image"/>
      </li>
       <li id="li6" runat="server" title="1">
        <img src="icono.png" class="img-responsive inline-block" alt="Responsive image" />
      </li>
         <li id="li8" runat="server" title="1">
        <img src="icono.png" class="img-responsive inline-block" alt="Responsive image" />
      </li>
       <li id="li7" runat="server" title="1">
        <img src="icono.png" class="img-responsive inline-block" alt="Responsive image" />
      </li>
        
    </ul>
  

    <form role="form" id="form1">
                                     <div  class="table-responsive">
<%--  <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>--%>
                                 <%--    <a onclick ="img1_click" runat="server">
                                     <asp:Image ID="img1" height="80" src="../../imgs/1.png" runat="server" />
                                     </a>--%>
<%--<asp:Image ID="imgI1" Height ="60" src="../../imgs/2.png" runat="server" />
                                     <asp:Image ID="Image1" Height ="60" src="../../imgs/1.png" runat="server" />
                                     <asp:Image ID="Image2" Height ="60" src="../../imgs/2.png" runat="server" />
                                     <asp:Image ID="Image3" Height ="60" src="../../imgs/1.png" runat="server" />
                                     <asp:Image ID="Image4" Height ="60" src="../../imgs/2.png" runat="server" />
                                     <asp:Image ID="Image5" Height ="60" src="../../imgs/1.png" runat="server" /> 
                                     <asp:Image ID="Image7" Height ="60" src="../../imgs/2.png" runat="server" />
                                     <asp:Image ID="Image8" Height ="60" src="../../imgs/1.png" runat="server" />
                                     <asp:Image ID="Image9" Height ="60" src="../../imgs/2.png" runat="server" />
                                     <asp:Image ID="Image10" Height ="60" src="../../imgs/1.png" runat="server" />
                                     <asp:Image ID="Image11" Height ="60" src="../../imgs/2.png" runat="server" />
                                     <asp:Image ID="Image12" Height ="60px" src="../../imgs/1.png" runat="server" Width="60px" />--%>
<asp:ImageButton ID="ImageButton1" runat="server" Height="70px" ImageUrl="icono.png"  />
                                         <asp:ImageButton ID="ImageButton2" runat="server" Height="30px" ImageUrl="flecha.png" />
</div>       
            <!--Delete Record Modal Ends here -->
</form>
</asp:Content>

