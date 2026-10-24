<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="org.apache.commons.lang.StringEscapeUtils"%>

<%
/**
 This application is for demonstration use only. It contains known application security
vulnerabilities that were created expressly for demonstrating the functionality of
application security testing tools. These vulnerabilities may present risks to the
technical environment in which the application is installed. You must delete and
uninstall this demonstration application upon completion of the demonstration for
which it is intended. 

IBM DISCLAIMS ALL LIABILITY OF ANY KIND RESULTING FROM YOUR USE OF THE APPLICATION
OR YOUR FAILURE TO DELETE THE APPLICATION FROM YOUR ENVIRONMENT UPON COMPLETION OF
A DEMONSTRATION. IT IS YOUR RESPONSIBILITY TO DETERMINE IF THE PROGRAM IS APPROPRIATE
OR SAFE FOR YOUR TECHNICAL ENVIRONMENT. NEVER INSTALL THE APPLICATION IN A PRODUCTION
ENVIRONMENT. YOU ACKNOWLEDGE AND ACCEPT ALL RISKS ASSOCIATED WITH THE USE OF THE APPLICATION.

IBM AltoroJ
(c) Copyright IBM Corp. 2008, 2013 All Rights Reserved.
*/
%> 
    
<jsp:include page="/header.jspf"/>

<div id="wrapper" style="width: 99%;">
	<jsp:include page="membertoc.jspf"/>
    <td valign="top" colspan="3" class="bb">
		<div class="fl" style="width: 99%;">
		
		<%
			/*
			 * Only redirect to a fixed allow-list of trusted, internal pages.
			 * The request parameter is used solely as a lookup key -- unknown
			 * or externally supplied destinations are ignored.
			 */
			java.util.Map<String, String> allowedRedirects = new java.util.HashMap<String, String>();
			allowedRedirects.put("home", request.getContextPath() + "/index.jsp");
			allowedRedirects.put("customize", request.getContextPath() + "/bank/customize.jsp");
			allowedRedirects.put("accounts", request.getContextPath() + "/bank/main.jsp");
			allowedRedirects.put("feedback", request.getContextPath() + "/feedback.jsp");
			allowedRedirects.put("subscribe", request.getContextPath() + "/subscribe.jsp");

			String content = request.getParameter("content");
			if (content != null && !content.equalsIgnoreCase("customize.jsp")){
				String redirectTarget = allowedRedirects.get(content);
				if (redirectTarget != null){
					response.sendRedirect(redirectTarget);
				}
			}
		%>
		
		<h1>Customize Site Language</h1>
		
		<form method="post">
		  <p>
		  Current Language: <%
		  	String lang = request.getParameter("lang");
		  	if (lang == null) {
		  		lang = "";
		  	}
		  	out.print(StringEscapeUtils.escapeHtml(lang));
		  %>
		  </p>
		
		  <p>
		  You can change the language setting by choosing:
		  </p>
		  <p>
		  <a id="HyperLink1" href="./customize.jsp?content=customize.jsp&lang=international">International</a>
		  <a id="HyperLink2" href="./customize.jsp?content=customize.jsp&lang=english">English</a>
		  </p>
		</form>
		
		</div>
    </td>	
</div>

<jsp:include page="/footer.jspf"/>  