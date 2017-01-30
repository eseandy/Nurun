<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="login.aspx.cs" Inherits="Nurun.login" %>
<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

	<div class="page-content container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="login-wrapper">
			        <div class="box">
			            <div class="content-wrap">
			                <h6>Sign In</h6>


<asp:TextBox ID="txtuser" CssClass="form-control" placeholder="usuario" runat="server"></asp:TextBox>

<asp:TextBox ID="txtpass" TextMode="Password" CssClass="form-control" placeholder="contraseña" runat="server"></asp:TextBox>
			                <div class="action">
			                    
<asp:Button ID="btnLogin" CssClass="btn btn-primary signup" runat="server" Text="Entrar" OnClick="btnLogin_Click" />
                                <br />
<asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
			                </div>                
			            </div>
			        </div>
			    </div>
			</div>
		</div>
	</div>

</asp:Content>
