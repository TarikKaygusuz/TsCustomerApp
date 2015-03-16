Imports CustomerApp.Models

Public Class _Default
    Inherits System.Web.UI.Page

    Dim dc As CustomerModelDataContext = New CustomerModelDataContext()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Not Page.IsPostBack) Then
            sdsCustomers.FilterExpression = "CustomerID = CustomerID"
            Session("filterExpression") = sdsCustomers.FilterExpression
        End If

    End Sub

    Protected Sub btn_Filter_Click(sender As Object, e As EventArgs) Handles btn_Filter.Click

        sdsCustomers.FilterParameters.Clear()
        Dim val As String = "Company like '%{0}%' OR NameSurname like '%{1}%' OR Phone like '%{2}%' OR Mobile like '%{3}%' OR Mail like '%{4}%' OR Address like '%{5}%' OR ID like '%{6}%'"
        sdsCustomers.FilterExpression = val

        sdsCustomers.FilterParameters.Add("ID", txtFiltering.Text.Trim())
        sdsCustomers.FilterParameters.Add("Company", txtFiltering.Text.Trim())
        sdsCustomers.FilterParameters.Add("NameSurname", txtFiltering.Text.Trim())
        sdsCustomers.FilterParameters.Add("Phone", txtFiltering.Text.Trim())
        sdsCustomers.FilterParameters.Add("Mobile", txtFiltering.Text.Trim())
        sdsCustomers.FilterParameters.Add("Mail", txtFiltering.Text.Trim())
        sdsCustomers.FilterParameters.Add("Address", txtFiltering.Text.Trim())

        Session("filterExpression") = sdsCustomers.FilterExpression


    End Sub

    Protected Sub btnHepsi_filter_Click(sender As Object, e As EventArgs) Handles btnHepsi_filter.Click
        sdsCustomers.FilterParameters.Clear()
        sdsCustomers.FilterExpression = "CustomerID = CustomerID"
        Session("filterExpression") = sdsCustomers.FilterExpression
    End Sub

    Protected Sub grdCustomers_Sorted(sender As Object, e As EventArgs) Handles grdCustomers.Sorted

        If Not String.IsNullOrEmpty(Session("FilterExpression")) Then
            sdsCustomers.FilterExpression = Session("FilterExpression").ToString()
        End If

    End Sub

    Protected Sub grdCustomers_PageIndexChanging(sender As Object, e As GridViewPageEventArgs) Handles grdCustomers.PageIndexChanging
        If Not String.IsNullOrEmpty(Session("FilterExpression")) Then
            sdsCustomers.FilterExpression = Session("FilterExpression").ToString()
        End If
    End Sub

    Protected Sub grdCustomers_RowDeleted(sender As Object, e As GridViewDeletedEventArgs) Handles grdCustomers.RowDeleted
        Session("filterExpression") = sdsCustomers.FilterExpression
    End Sub

    Protected Sub grdCustomers_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles grdCustomers.RowDataBound

        Dim customer = dc.sp_CustomerCount()

        lblAffectedRows.Text = String.Format("Listelenen : {0} - Toplam : {1}", grdCustomers.Rows.Count, customer.ReturnValue)
    End Sub
End Class