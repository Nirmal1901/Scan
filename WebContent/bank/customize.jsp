<%@ page import="org.apache.commons.lang3.StringEscapeUtils" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

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

<%!
	/*
	 * Fixed allow-list of redirect destinations for the 'content' parameter.
	 * The parameter is only ever used as a lookup key into this map, never as a
	 * URL: every value below is a literal internal path, so no request-supplied
	 * value can reach sendRedirect(). Keys that are not in the map (including
	 * external http/https URLs) result in no redirect and the page is rendered.
	 */
	private static final java.util.Map<String,String> REDIRECT_ROUTES = new java.util.HashMap<String,String>();
	static {
		REDIRECT_ROUTES.put("customize", "customize.jsp");
	}
%>
    
<jsp:include page="/header.jspf"/>

<div id="wrapper" style="width: 99%;">
	<jsp:include page="membertoc.jspf"/>
    <td valign="top" colspan="3" class="bb">
		<div class="fl" style="width: 99%;">
		
		<%
			String content = request.getParameter("content");
			String lang = request.getParameter("lang");
			/* "customize.jsp" is this page's own value (used by the language links
			   below); a self redirect would drop ?lang=, so it is a no-op here. */
			String destination = (content == null || content.equalsIgnoreCase("customize.jsp"))
					? null
					: REDIRECT_ROUTES.get(content);
			if (destination != null){
				response.sendRedirect(destination);
			}
		%>
		
		<h1>Customize Site Language</h1>
		
		<form method="post">
		  <p>
		  Current Language: <%= (lang == null) ? "" : StringEscapeUtils.escapeHtml4(lang) %>
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