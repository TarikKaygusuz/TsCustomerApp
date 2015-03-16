<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Main.Master" CodeBehind="Detay.aspx.vb" Inherits="CustomerApp.Detay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="pageTitle">
        Müşteri Detay
        <img width="25" height="25" src="Content/images/cst_ico.png" />
    </div>
    <br />
    <div id="divMusteriDetay">
        <div class="middle">
            <table cellpadding="0" cellspacing="2" border="0" width="100%">

                <tr>
                    <td class="label">
                        <asp:Label ID="Label3" runat="server" Text="Ad Soyad"></asp:Label>
                    </td>
                    <td class="div_textbox">
                        <asp:TextBox ID="txtAdSoyad" runat="server" CssClass="validate[required] text" ValidationGroup="grp1" Text=""></asp:TextBox>

                    </td>
                </tr>

                <tr>
                    <td class="label">
                        <asp:Label ID="Label7" runat="server" Text="Şehir"></asp:Label>
                    </td>
                    <td class="div_textbox">
                        <asp:SqlDataSource ConnectionString="<%$ ConnectionStrings:TatilSepeti %>" ID="sdsSehirler" SelectCommand="Select CityID,CityName from Cities" runat="server"></asp:SqlDataSource>
                        <asp:DropDownList ID="ddlCities" CssClass="validate[required] text divDll" ValidationGroup="grp1" DataSourceID="sdsSehirler" DataTextField="CityName" DataValueField="CityID" runat="server"></asp:DropDownList>
                    </td>
                </tr>

                <tr>
                    <td class="label">
                        <asp:Label ID="Label1" runat="server" Text="Ev Tel"></asp:Label>
                    </td>
                    <td class="div_textbox">
                        <asp:TextBox ID="txtPhone" runat="server" Text=""></asp:TextBox>

                    </td>
                </tr>

                <tr>
                    <td class="label">
                        <asp:Label ID="Label2" runat="server" Text="Cep Tel"></asp:Label>
                    </td>
                    <td class="div_textbox">
                        <asp:TextBox ID="txtMobile" runat="server" Text=""></asp:TextBox>

                    </td>
                </tr>

                <tr>
                    <td class="label">
                        <asp:Label ID="Label4" runat="server" Text="E-Mail"></asp:Label>
                    </td>
                    <td class="div_textbox">
                        <asp:TextBox ID="txtEmail" CssClass="validate[custom[email] text" ValidationGroup="grp1" runat="server" Text=""></asp:TextBox>

                    </td>
                </tr>

                <tr>
                    <td class="label">
                        <asp:Label ID="Label5" runat="server" Text="Adres"></asp:Label>
                    </td>
                    <td class="div_textbox">
                        <asp:TextBox ID="txtAdres" TextMode="MultiLine" runat="server" Text=""></asp:TextBox>

                    </td>
                </tr>

                <tr>
                    <td class="label">
                        <asp:Label ID="Label12" runat="server" Text="Vergi Dairesi"></asp:Label>
                    </td>
                    <td class="div_textbox">
                        <asp:TextBox ID="txtTaxOffice" runat="server" Text=""></asp:TextBox>

                    </td>
                </tr>

                <tr>
                    <td class="label">
                        <asp:Label ID="Label13" runat="server" Text="Vergi No"></asp:Label>
                    </td>
                    <td class="div_textbox">
                        <asp:TextBox ID="txtTaxNumber" CssClass="validate[custom[integer]]" ValidationGroup="grp1" runat="server" Text=""></asp:TextBox>

                    </td>
                </tr>

                <tr>
                    <td class="label">
                        <asp:Label ID="Label8" runat="server" Text="Sektörler"></asp:Label>
                    </td>
                    <td class="div_textbox">
                        <asp:SqlDataSource ConnectionString="<%$ ConnectionStrings:TatilSepeti %>" ID="sdsSektorler" SelectCommand="Select SectorID,Sector from Sectors" runat="server"></asp:SqlDataSource>
                        <asp:DropDownList ID="ddlSectors" CssClass="validate[required] text divDll" ValidationGroup="grp1" DataSourceID="sdsSektorler" DataTextField="Sector" DataValueField="SectorID" runat="server"></asp:DropDownList>
                    </td>
                </tr>

                <tr>
                    <td class="label">
                        <asp:Label ID="Label6" runat="server" Text="Kurum Adı"></asp:Label>
                    </td>
                    <td class="div_textbox">
                        <asp:TextBox ID="txtKurumAdi" runat="server" Text=""></asp:TextBox>

                    </td>
                </tr>

                <tr>
                    <td class="label">
                        <asp:Label ID="Label10" runat="server" Text="Firma Yetkilisi"></asp:Label>
                    </td>
                    <td class="div_textbox">
                        <asp:TextBox ID="txtAuthorizedPerson" runat="server" Text=""></asp:TextBox>

                    </td>
                </tr>

                <tr>
                    <td class="label">
                        <asp:Label ID="Label11" runat="server" Text="Firma Yetkilisi Cep"></asp:Label>
                    </td>
                    <td class="div_textbox">
                        <asp:TextBox ID="txtAuthorizedPersonMobile" runat="server" Text=""></asp:TextBox>

                    </td>
                </tr>

                <tr>
                    <td class="label">
                        <asp:Label ID="Label9" runat="server" Text="Müşteri Temsilcisi"></asp:Label>
                    </td>
                    <td class="div_textbox">
                        <asp:SqlDataSource ConnectionString="<%$ ConnectionStrings:TatilSepeti %>" ID="sdsCustomerAgents" SelectCommand="Select AgentID,CustomerAgent from CustomerAgents" runat="server"></asp:SqlDataSource>
                        <asp:DropDownList ID="ddlCustomerAgents" CssClass="validate[required] text divDll" ValidationGroup="grp1" DataSourceID="sdsCustomerAgents" DataTextField="CustomerAgent" DataValueField="AgentID" runat="server"></asp:DropDownList>
                    </td>
                </tr>

                <tr>
                    <td class="label">
                        <asp:Label ID="Label14" runat="server" Text="Notlar"></asp:Label>
                    </td>
                    <td class="div_textbox">
                        <asp:TextBox ID="txtNotes" TextMode="MultiLine" runat="server" Text=""></asp:TextBox>

                    </td>
                </tr>

                <tr>
                    <td></td>
                    <td>

                        <a href="Default.aspx">
                            <img src="Content/images/cancel.png" alt="Cancel" /></a>

                        <asp:ImageButton ImageUrl="~/Content/images/save.png" ValidationGroup="grp1" ID="imgKaydet" runat="server"
                            Text="Kaydet" />

                    </td>
                </tr>

            </table>
        </div>
    </div>
</asp:Content>
