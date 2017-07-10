<%@ Page Title="" Language="C#" MasterPageFile="~/master_pages/MasterPage.master" AutoEventWireup="true" CodeFile="maquinas.aspx.cs" Inherits="usuarios_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
        <title>Perfiles</title>

    <style type="text/css">
        .modalBackground {
            background-color: Black;
            filter: alpha(opacity=90);
            opacity: 0.8;
            z-index: 10000;
        }

        .table th {
            text-align: center;
        }
         .page-header {
    padding-bottom: 0px;
    }
         .row li {
  width: 10%;
  float: left;
}

ul{
    list-style:none;
  }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">



    <div class="row">
        <div class="col-lg-12">
            <%--<div class="panel panel-default">
                        <div class="panel-heading">--%>
        </div>
        <div class="panel-body">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Línea de producción: <asp:Label ID="lblLinea" runat="server" Text=""></asp:Label>
                           <asp:Button ID="btnPopUp" runat="server" Text="Nueva Maquina" class="btn btn-primary" OnClick="btnPopUp_Click" />
                        </h1>
                    <%-- inicio modal prueba :V  --%>



                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>

                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <%--<br />--%>
                         

                            <br />
                        </ContentTemplate>
                    </asp:UpdatePanel>

                    <asp:Button ID="btnInicial" runat="server" Text="Button" Style="display: none" />

                    <asp:ModalPopupExtender ID="btnPopUp_ModalPopupExtender" runat="server"
                        DynamicServicePath="" Enabled="True" TargetControlID="btnInicial"
                        BackgroundCssClass="modalBackground" PopupControlID="PanelModal">
                    </asp:ModalPopupExtender>

                    <asp:Panel ID="PanelModal" runat="server" Style="display: none; background: white; width: 80%; height: auto">
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                    <h3 id="myModalLabel">Maquinas</h3>
                                </div>
                                <div class="modal-body">
                                    <div class="container-fluid well">
                                        <div class="row-fluid">


                                            <div class="span4 ">
                                                <%-- Inicio de formulario men :v --%>
                                                <asp:Panel ID="pn_nombre" runat="server" class="form-group">
                                                    <asp:TextBox ID="txtNombre" runat="server" class="form-control"
                                                        placeholder="Nombre" TabIndex="4" ValidationGroup="val4">  </asp:TextBox>
                                                    <asp:TextBox ID="txtSerie" runat="server" class="form-control"
                                                        placeholder="No.Serie" TabIndex="4" ValidationGroup="val4">  </asp:TextBox>
                                                <%--</asp:Panel>--%>

                                               <%-- <asp:Panel ID="pn_ap_paterno" runat="server" class="form-group">
                                                    <asp:TextBox ID="txtAp_paterno" runat="server" class="form-control"
                                                        placeholder="Apellido Paterno" TabIndex="4" ValidationGroup="val4"></asp:TextBox>
                                                </asp:Panel>--%>

                                               <%-- <asp:Panel ID="pn_empresas" runat="server" class="form-group">--%>
                                                   
                                                </asp:Panel>

                                              </div>

                                            <%-- fin de formulario men :v--%>
                                        </div>


                                    </div>

                                </div>
                                <div class="modal-footer">
                                    <asp:Button ID="btnClose" runat="server" Text="Cerrar" class="btn"
                                        data-dismiss="modal" aria-hidden="true" OnClick="btnClose_Click" ControlStyle-CssClass="btn btn-danger" />

                                    <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar" class="btn"
                                        data-dismiss="modal" aria-hidden="true" OnClick="btnLimpiar_Click" ControlStyle-CssClass="btn btn-success" />

                                    <asp:Button ID="btn_registrar_actualizar" runat="server" Text="Registrar" class="btn"
                                        data-dismiss="modal" aria-hidden="true" OnClick="btnGuardar_Click" ControlStyle-CssClass="btn btn-primary" />

                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>


                    </asp:Panel>

                    <%--  Terminacion modal prueba :V  --%>
                                    
                                    <form role="form" id="form1">
                                        <div class="col-lg-12">
                                           
                                                
                                            <ul>
                                               
          <li id="li1" runat="server" title="1" >
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
        <img src="icono.png" class="img-responsive inline-block" alt="Responsive image"/>
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

                                        <!--Delete Record Modal Ends here -->
                </div>
                </form>
                                   
                                     
                                
                                <!-- /.col-lg-6 (nested) -->
            </div>
            <!-- /.row (nested) -->

        </div>

        <!-- /.panel-body -->
    </div>

    <!-- /.panel -->
    </div>
                <!-- /.col-lg-12 -->
    </div>
            <!-- /.row -->



</asp:Content>

