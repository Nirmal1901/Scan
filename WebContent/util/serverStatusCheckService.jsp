<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="org.apache.commons.lang.StringEscapeUtils" %>
<% String hostName = StringEscapeUtils.escapeHtml(request.getParameter("HostName")); %>

{
	"HostName": "<%=hostName%>",
	"HostStatus": "OK"
}