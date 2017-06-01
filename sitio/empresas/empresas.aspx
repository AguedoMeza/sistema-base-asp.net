<%@ Page Title="" Language="C#" MasterPageFile="~/master_pages/MasterPage.master" AutoEventWireup="true" CodeFile="empresas.aspx.cs" Inherits="empresas_empresas" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    
    
            <div class="row">
                <div class="col-lg-12">
                    <%--<div class="panel panel-default">--%>
                    <%--    <div class="panel-heading">--%>
                 
					  
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-12">
                                       <h1 class="page-header">Catalogo de Empresas</h1>
                             <%-- inicio modal prueba :V  --%>
        

        
       
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
  <p>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">

        <ContentTemplate>
           
            <br />
                  <asp:Button ID="btnPopUp" runat="server" Text="Nuevo Empresa" class="btn btn-primary" OnClick="btnPopUp_Click" />
                        
<br />
          
        </ContentTemplate>
    </asp:UpdatePanel>
             </p>    
                    <%-- INICIO DEL MODAL --%>

    <asp:Button ID="btnInicial" runat="server" Text="Button" style="display:none" />

            <asp:ModalPopupExtender ID="btnPopUp_ModalPopupExtender" runat="server" 
                DynamicServicePath="" Enabled="True" TargetControlID="btnInicial" 
                BackgroundCssClass="modalBackground" PopupControlID="PanelModal">
            </asp:ModalPopupExtender>

            <asp:Panel ID="PanelModal" runat="server" style="display:none; background:white; width:80%; height:auto">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h3 id="myModalLabel">Empresas</h3>
              </div>
              <div class="modal-body">
                    <div class="container-fluid well">
                        <div class="row-fluid">
                            <div class="span4 ">
                                <%-- Inicio de formulario men :v --%>
                                <asp:Panel ID="pn_nombre" runat="server" class="form-group">
                                             <asp:TextBox ID="txtNombre" runat="server" class="form-control" 
                                            placeholder="Nombre" TabIndex="4" ValidationGroup="val4"></asp:TextBox>
                                </asp:Panel>

                                <asp:Panel ID="pn_direccion" runat="server"  class="form-group">
                                    <asp:TextBox ID="txtDireccion" runat="server" class="form-control" 
                                            placeholder="Direccion" TabIndex="4" ValidationGroup="val4"></asp:TextBox>
                                </asp:Panel>

                                <asp:Panel ID="pn_rfc" runat="server" class="form-group">
                      
                                   <asp:TextBox ID="txtrfc" runat="server" class="form-control" 
                                            placeholder="RFC" TabIndex="4" ValidationGroup="val4"></asp:TextBox>
                                </asp:Panel>

                                <asp:Panel ID="pn_razon" runat="server"  class="form-group">
                                      <asp:TextBox ID="txtrazon_social" runat="server" class="form-control" 
                                            placeholder="Razon_Social" TabIndex="4" ValidationGroup="val4"></asp:TextBox>
                                </asp:Panel>

                                <asp:Panel ID="pn_con" runat="server"  class="form-group">
                                    <asp:TextBox ID="TxtCon" runat="server" class="form-control" 
                                            placeholder="Contato" TabIndex="4" ValidationGroup="val4"></asp:TextBox>
                                </asp:Panel>

                                

                                </asp:Panel>
                                
                            </div>

                           <%-- fin de formulario men :v--%>
                               
                                
                              
                            </div>
                          
                                </div>
                                
                          
                  
              </div>
              <div class="modal-footer">
                  <asp:Button ID="btnClose" runat="server" Text="Cerrar" class="btn" 
                      data-dismiss="modal" aria-hidden="true" onclick="btnClose_Click"  ControlStyle-CssClass="btn btn-danger"/>

                  <asp:Button ID="btnGuardar" runat="server" Text="Limpiar" class="btn" 
                      data-dismiss="modal" aria-hidden="true" onclick="btnGuardar_Click"  ControlStyle-CssClass="btn btn-success"/>

                   <asp:Button ID="btn_registrar_actualizar" runat="server" Text="Registrar" class="btn" 
                      data-dismiss="modal" aria-hidden="true" onclick="btnGuardar_Click"  ControlStyle-CssClass="btn btn-primary"/>
               
              </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
                
                
            </asp:Panel>
        
       <%--  Terminacion modal prueba :V  --%>
                                    <form role="form" id="form1">
                                        <div  class="table-responsive">
                                        <asp:GridView ID="GridEmpresa" runat="server" class="table table-striped table-bordered table-hover" AutoGenerateColumns="False" OnRowDeleting="GridView1_RowDeleting" OnRowCommand="GridView1_RowCommand1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                                  <Columns>
                                               <asp:BoundField DataField="id" ItemStyle-HorizontalAlign="Center"  HeaderText="ID" />
                                                <asp:BoundField DataField="nombre" ItemStyle-HorizontalAlign="Center"  HeaderText="Nombre" />
                                                <asp:BoundField DataField="direccion" HeaderText="Direccion" />
                                             <%--<asp:BoundField DataField="Empresa" HeaderText="Empresa" />--%>
                                               <asp:BoundField DataField="rfc" ItemStyle-HorizontalAlign="Center"  HeaderText="RFC" />
                                                <asp:BoundField DataField="razon_Social" ItemStyle-HorizontalAlign="Center"  HeaderText="Razon Social" />
                                               <asp:BoundField DataField="contacto" ItemStyle-HorizontalAlign="Center"  HeaderText="Contacto" />
                                         <%-- <asp:BoundField DataField="Fecha" HeaderText="FECHA" />
                                          <asp:BoundField DataField="Hora" HeaderText="hora" />--%>

                                              <asp:ButtonField ButtonType="Button" ItemStyle-HorizontalAlign="Center"  CommandName="Actualizar"
                                    HeaderText="Editar" Text="Actualizar"  ControlStyle-CssClass="btn btn-success"   />


                                              <asp:CheckBoxField DataField="Activo" HeaderText="Activo" />
                                           </Columns>
                                        </asp:GridView>
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

