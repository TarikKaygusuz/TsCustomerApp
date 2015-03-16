Imports CustomerApp.Models
Imports System.Web.UI
Imports System.Web.UI.WebControls

Public Class Detay
    Inherits System.Web.UI.Page

    Dim dc As CustomerModelDataContext = New CustomerModelDataContext()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If (Not Page.IsPostBack) Then

            SetFirstItemtoList(ddlCities)
            SetFirstItemtoList(ddlCustomerAgents)
            SetFirstItemtoList(ddlSectors)

            If Not String.IsNullOrEmpty(Request.QueryString("id")) Then
                'Details
                Dim id As String = Request.QueryString("id")
                Dim customer = dc.sp_CustomersbyID(Int32.Parse(id)).Single()
                txtAdSoyad.Text = customer.NameSurname
                txtKurumAdi.Text = customer.Company
                txtEmail.Text = customer.Mail
                txtPhone.Text = customer.Phone
                txtMobile.Text = customer.Mobile
                txtAdres.Text = customer.Address
                ddlCities.SelectedValue = customer.CityID
                ddlSectors.SelectedValue = customer.SectorID
                ddlCustomerAgents.SelectedValue = customer.AgentID
                txtAuthorizedPerson.Text = customer.AuthorizedPerson
                txtAuthorizedPersonMobile.Text = customer.AuthorizedPersonMobile
                txtTaxOffice.Text = customer.TaxOffice
                txtTaxNumber.Text = customer.TaxNumber
                txtNotes.Text = customer.Notes

            End If

        End If

    End Sub


    Public Sub SetFirstItemtoList(drp As DropDownList)
        drp.Items.Clear()
        drp.Items.Insert(0, New ListItem(String.Empty, String.Empty))
        drp.AppendDataBoundItems = True
    End Sub


    Protected Sub imgKaydet_Click(sender As Object, e As ImageClickEventArgs) Handles imgKaydet.Click
        If String.IsNullOrEmpty(Request.QueryString("id")) Then
            dc.sp_InsertCustomers(txtAdSoyad.Text, txtKurumAdi.Text, txtPhone.Text, txtMobile.Text, txtEmail.Text, txtAdres.Text, ddlCities.SelectedValue, ddlSectors.SelectedValue, ddlCustomerAgents.SelectedValue, txtAuthorizedPerson.Text, txtAuthorizedPersonMobile.Text, txtTaxOffice.Text, txtTaxNumber.Text, txtNotes.Text)
        Else
            Dim id As String = Request.QueryString("id")
            dc.sp_UpdateCustomers(Int32.Parse(id), txtAdSoyad.Text, txtKurumAdi.Text, txtPhone.Text, txtMobile.Text, txtEmail.Text, txtAdres.Text, ddlCities.SelectedValue, ddlSectors.SelectedValue, ddlCustomerAgents.SelectedValue, txtAuthorizedPerson.Text, txtAuthorizedPersonMobile.Text, txtTaxOffice.Text, txtTaxNumber.Text, txtNotes.Text)
        End If

        dc.SubmitChanges()
        Response.Redirect("Default.aspx")
    End Sub
End Class