<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="org.apache.commons.lang3.StringEscapeUtils" %>

{
<%
	String hostName = request.getParameter("HostName");
	if (hostName == null) {
		hostName = "";
	}
	hostName = StringEscapeUtils.escapeHtml4(hostName);
%>
	"HostName": "<%= hostName %>",
	"HostStatus": "OK"
}