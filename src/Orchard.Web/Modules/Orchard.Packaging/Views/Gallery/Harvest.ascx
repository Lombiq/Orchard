﻿<%@ Control Language="C#" Inherits="Orchard.Mvc.ViewUserControl<Orchard.Packaging.ViewModels.PackagingHarvestViewModel>" %>
<h1>
    <%: Html.TitleForPage(T("Packaging").ToString(), T("Harvest Packages").ToString())%></h1>
    <%: Html.Partial("_Subnav", Model) %>

<%using (Html.BeginFormAntiForgeryPost()) {%>
<%: Html.ValidationSummary(T("Package creation was unsuccessful. Please correct the errors and try again.").ToString()) %>
<%foreach (var group in Model.Extensions.Where(x => !x.Location.StartsWith("~/Core")).GroupBy(x => x.ExtensionType)) {%>
<fieldset>
    <legend><%: T("Harvest") %>
        <%:group.Key %></legend>
    <ul>
        <%foreach (var item in group) {%>
        <li>
            <label>
                <%:Html.RadioButtonFor(m=>m.ExtensionName, item.Name, new Dictionary<string, object>{{"id",item.Name}}) %>
                <%:item.DisplayName%></label></li><%
                                                      }%></ul>
    <%} %>
    <%: Html.ValidationMessageFor(m => m.ExtensionName)%>
</fieldset>
<fieldset>
    <%: Html.LabelFor(m=>m.FeedUrl)%>
    <%: Html.DropDownListFor(m => m.FeedUrl, new[]{new SelectListItem{Text=T("Download").ToString(),Value="Download"}}.Concat( Model.Sources.Select(x => new SelectListItem { Text = T("Push to {0}", x.FeedUrl).ToString(), Value = x.FeedUrl })))%>
    <%: Html.ValidationMessageFor(m=>m.FeedUrl) %>
</fieldset>
<input type="submit" value="Harvest" />
<%} %>
