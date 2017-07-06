<%@ Page Title="" Language="C#" MasterPageFile="~/master_pages/MasterPage.master" AutoEventWireup="true" CodeFile="maquinas.aspx.cs" Inherits="administracion_lineas_produccion_maquinas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <style>
.row li {
  width: 33.3%;
  float: left;
}

img {
  border: 0 none;
  display: inline-block;
  height: auto;
  max-width: 100%;
  vertical-align: middle;
}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1 class="page-header" >Línea de producción: Polvos</h1>
   <div class="row">
  <div id="small-img" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 center">
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
        <img src="icono.png" class="img-responsive inline-block" alt="Responsive image" />
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
  </div>
</div>
</asp:Content>

