<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Main.Master" CodeBehind="Default.aspx.vb" Inherits="CustomerApp._Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function clickButton(e, buttonid) {
            var evt = e ? e : window.event;
            var bt = document.getElementById(buttonid);

            if (bt) {
                if (evt.keyCode == 13) {
                    bt.click();
                    return false;
                }
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="pageTitle">
        Müşteriler 
        <img width="25" height="25" src="Content/images/cst_ico.png" />
    </div>
    <br />
    <div id="divMusteriler">
        <asp:UpdatePanel runat="server" ID="upMusteriler">
            <ContentTemplate>
                <div class="middleheader">
                </div>
                <div class="middle">
                    <table cellpadding="0" cellspacing="2" border="0" width="100%">
                        <tr>
                            <td>
                                <div class="toolbox">
                                    <asp:Button ID="btnHepsi_filter" runat="server" Text="Tümünü Göster" />
                                    <asp:TextBox ID="txtFiltering" runat="server" Width="175px"
                                        onkeypress="return clickButton(event,'btn_Filter')"></asp:TextBox>
                                    <asp:Button ID="btn_Filter" ClientIDMode="Static" runat="server" Text="ARA" />
                                    <br />
                                    <br />
                                    <div class="btndiv">
                                        <asp:LinkButton ID="lbYeniEkle" PostBackUrl="~/Detay.aspx" runat="server" Text="Yeni Ekle"></asp:LinkButton>
                                    </div>
                                </div>
                                <div class="progressbar">
                                    <asp:UpdateProgress ID="UpdateProgress" runat="server" DisplayAfter="0" DynamicLayout="False">
                                        <ProgressTemplate>
                                            <asp:Label ID="lblLoading" runat="server"></asp:Label>
                                            <br />
                                            <asp:Image ID="upProgress" runat="server" ImageUrl="~/Content/images/loading.gif" />
                                        </ProgressTemplate>
                                    </asp:UpdateProgress>
                                </div>
                                <br />
                                <div class="affectedRows" style="text-align: center">
                                    <asp:Label ID="lblAffectedRows" runat="server" Text=""></asp:Label>
                                </div>
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:SqlDataSource ID="sdsCustomers" ConnectionString="<%$ ConnectionStrings:TatilSepeti %>" DeleteCommand="Delete from Customers where CustomerID=@CustomerID" SelectCommand="Select CAST(CustomerID as nvarchar(50) ) as ID, CustomerID,NameSurname,Company ,Phone ,Mobile ,Mail,Address from Customers order by CustomerID desc"
                                    runat="server"></asp:SqlDataSource>
                                <asp:GridView ID="grdCustomers" DataSourceID="sdsCustomers" Width="100%" CssClass="musTable"
                                    runat="server" AutoGenerateColumns="False" AllowPaging="True" DataKeyNames="CustomerID"
                                    AllowSorting="True" PageSize="50"
                                    ViewStateMode="Enabled">
                                    <HeaderStyle CssClass="baslik" />
                                    <RowStyle CssClass="tekSatir" />
                                    <AlternatingRowStyle CssClass="ciftSatir" />
                                    <Columns>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:HyperLink ID="lnkGuncelle" NavigateUrl='<%# Eval("CustomerID", "~/Detay.aspx?id={0}") %>'
                                                    runat="server" Text="Detay"></asp:HyperLink>
                                                <br />
                                                <asp:Button runat="server" ID="Sil" CommandArgument='<%# Eval("CustomerID")%>' CommandName="Delete" Text="Sil" />
                                                <cc1:ConfirmButtonExtender ID="Confirm" TargetControlID="Sil" ConfirmText="Kayıt Silinecek. Emin misiniz?"
                                                    runat="server" Enabled="True">
                                                </cc1:ConfirmButtonExtender>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="CustomerID"
                                            InsertVisible="False" ReadOnly="True" />
                                        <asp:BoundField DataField="NameSurname" HeaderText="Ad Soyad" SortExpression="NameSurname"
                                            InsertVisible="False" ReadOnly="True" />
                                        <asp:BoundField DataField="Company" HeaderText="Kurum Adı" SortExpression="Company" InsertVisible="False"
                                            ReadOnly="True" />
                                        <asp:BoundField DataField="Phone" HeaderText="Ev Tel" SortExpression="Phone"
                                            InsertVisible="False" ReadOnly="True" />
                                        <asp:BoundField DataField="Mobile" HeaderText="Cep Tel" SortExpression="Mobile"
                                            InsertVisible="False" ReadOnly="True" />
                                        <asp:BoundField DataField="Mail" HeaderText="E-Mail" SortExpression="Mail" InsertVisible="False"
                                            ReadOnly="True" />
                                        <asp:BoundField DataField="Address" HeaderText="Adres" SortExpression="Address" InsertVisible="False"
                                            ReadOnly="True" />

                                    </Columns>
                                    <EmptyDataTemplate>
                                        <asp:Label ID="lblInfo" runat="server" Text="Müşteri Kayıdı Bulunmamaktadır."></asp:Label>
                                    </EmptyDataTemplate>
                                </asp:GridView>
                            </td>
                        </tr>
                    </table>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
