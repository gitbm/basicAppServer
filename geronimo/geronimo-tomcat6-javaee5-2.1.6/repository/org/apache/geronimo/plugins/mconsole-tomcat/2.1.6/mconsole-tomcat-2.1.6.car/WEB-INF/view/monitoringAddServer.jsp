<%--
   Licensed to the Apache Software Foundation (ASF) under one or more
   contributor license agreements.  See the NOTICE file distributed with
   this work for additional information regarding copyright ownership.
   The ASF licenses this file to You under the Apache License, Version 2.0
   (the "License"); you may not use this file except in compliance with
   the License.  You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/portlet" prefix="portlet"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/CommonMsg.tld" prefix="CommonMsg"%>
<%@ page import="org.apache.geronimo.monitoring.console.StatsGraph" %>
<%@ page import="org.apache.geronimo.monitoring.console.GraphsBuilder" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.TreeMap" %>
<%@ page import="java.lang.String" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DatabaseMetaData" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="org.apache.geronimo.monitoring.console.util.*" %>
<fmt:setBundle basename="monitor-portlet"/>
<portlet:defineObjects/>

<%

String name = (String) request.getAttribute("name");
String ip = (String) request.getAttribute("ip");
String username = (String) request.getAttribute("username");
String password = (String) request.getAttribute("password");
String password2 = (String) request.getAttribute("password2");
String port = (String) request.getAttribute("port");
String protocol = (String) request.getAttribute("protocol");

if(name == null)        name = "";
if(ip == null)          ip = "";
if(username == null)    username = "";
if(password == null)    password = "";
if(password2 == null)   password2 = "";
if(protocol == null)    protocol = "";
if(protocol.equals("1"))    
{
    if(port == null)        port = "1099";
}
else if(protocol.equals("2"))
{
    if(port == null)        port = "4201";
}
else
{
    protocol = "1";
    if(port == null)        port = "1099";
}

%>
<!-- <head> -->

    <style type='text/css'>
    </style>
    <script type='text/javascript' src='/dojo/dojo.js'>
    </script>
        <script type = "text/javascript">
<!--
function hide(x) {
    document.getElementById(x).style.display='none';
}
function show(x) {
    document.getElementById(x).style.display='';
}
function validate() {
	if (! (document.addServer.name.value 
		&& document.addServer.ip.value 
		&& document.addServer.username.value
		&& document.addServer.password.value
		&& document.addServer.port.value ))
	{
		alert("Name, Address, Protocol, Port, Username, and Password are all required fields");
		return false;
	}
	if (document.addServer.password.value != document.addServer.password2.value)
	{
		alert("Passwords do not match");
		return false;
	}
	return true;
}
function noAlpha(obj) {
    reg = /[^0-9]/g;
    obj.value =  obj.value.replace(reg,"");
}
function setPort() {
    if (document.addServer.protocol[0].checked == true)
        document.addServer.port.value = "1099";
    else
        document.addServer.port.value = "4201";
}
//-->
</script>
<!-- </head> -->
        
<CommonMsg:commonMsg/><br>

<table>
    <tr>
        <!-- Body -->
        <td width="90%" align="left" valign="top">
            <p>
            <font face="Verdana" size="+1">
            <fmt:message key="monitor.server.addServer"/>
            </font>
            </p>         
            <p>
  <form name="addServer" method="POST" action="<portlet:actionURL/>">
  <table cellpadding="1" cellspacing="1">
    <tr>
      <td><fmt:message key="monitor.common.name"/>:</td>
      <td>&nbsp;</td>
      <td align="right"><input type="text" name="name" value=<%= "\"" + name + "\"" %>></td>
      <td></td>
    </tr>
    <tr>
      <td><fmt:message key="monitor.server.ip"/>/<fmt:message key="monitor.server.hostname"/>:</td>
      <td>&nbsp;</td>
      <td align="right"><input type="text" name="ip" value="<%=ip%>"/></td>
      <td></td>
    </tr>
    <tr>
      <td><fmt:message key="monitor.server.protocol"/></td>
      <td>&nbsp;</td>
      <td align="right"><input type="radio" name="protocol" onchange='setPort()' value="1" <%if (protocol.equals("1")){ %>checked="checked"<%} %>>JMX<input type="radio" name="protocol" onchange='setPort()' value="2" <%if (protocol.equals("2")){ %>checked="checked"<%} %>>EJB</td>
      <td></td>
    </tr>
    <tr>
      <td><fmt:message key="monitor.server.port"/>:</td>
      <td>&nbsp;</td>
      <td align="right"><input type="text" name="port"  onKeyUp='noAlpha(this)' onKeyPress='noAlpha(this)' value="<%=port%>"/></td>
      <td></td>
    </tr>
    <tr>
      <td><fmt:message key="monitor.server.username"/>:</td>
      <td>&nbsp;</td>
      <td align="right"><input type="text" name="username" value=<%= "\"" + username + "\"" %>/></td>
      <td></td>
    </tr>
    <tr>
      <td><fmt:message key="monitor.server.pwd"/>:</td>
      <td>&nbsp;</td>
      <td align="right"><input type="password" name="password" value=<%= "\"" + password + "\"" %>/></td>
      <td></td>
    </tr>
    <tr>
      <td><fmt:message key="monitor.server.pwd2"/>:</td>
      <td>&nbsp;</td>
      <td align="right"><input type="password" name="password2" value=<%= "\"" + password2 + "\"" %>/></td>
      <td></td>
    </tr>
    <tr><td colspan="2"><font size="-2">&nbsp;</font></td></tr>
    <tr>
      <input type="hidden" name="mode" value="" />
      <input type="hidden" name="action" value="" />
      <td colspan="1" align="left"><button type="button" value='<fmt:message key="monitor.common.cancel"/>' onclick="javascript:history.go(-1)"><fmt:message key="monitor.common.cancel"/></button></td>
      <td>&nbsp;</td>
      <td colspan="1" align="right"><input type="button" value='<fmt:message key="monitor.common.add"/>' onclick="document.addServer.action.value='saveAddServer'; document.addServer.mode.value='edit'; if(validate()) document.addServer.submit();" /></td>
      <td></td>
    </tr>
  </table>
  

            </p>

        </td>
     
         <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>

        <!-- Geronimo Links -->
        <td valign="top">
            <table width="100%" style="border-bottom: 1px solid #2581c7;" cellspacing="1" cellpadding="1">
                <tr>
                    <td class="DarkBackground" align="left" nowrap>
                        <font face="Verdana" size="+1"><fmt:message key="monitor.common.nav"/></font>
                    </td>
                </tr>
                <tr>
                    <td bgcolor="#FFFFFF" nowrap>
                        &nbsp;<br />
                        <ul>
                        <li><a href="<portlet:actionURL portletMode="view"><portlet:param name="action" value="showHome" /></portlet:actionURL>"><fmt:message key="monitor.common.home"/></a></li>
                        <li><a href="<portlet:actionURL portletMode="view"><portlet:param name="action" value="showAllViews" /></portlet:actionURL>"><fmt:message key="monitor.common.view"/></a></li>
                        <li><a href="<portlet:actionURL portletMode="view"><portlet:param name="action" value="showAllServers" /></portlet:actionURL>"><fmt:message key="monitor.common.server"/></a></li>
                        <li><a href="<portlet:actionURL portletMode="view"><portlet:param name="action" value="showAllGraphs" /></portlet:actionURL>"><fmt:message key="monitor.common.graph"/></a></li>
                        </ul>
                        &nbsp;<br />
                    </td>   
                </tr>
            </table>
            <table width="100%" cellspacing="1" cellpadding="1">
            <tr>
            <td>
            </td>
            </tr>
            </table>
            <table width="100%" style="border-bottom: 1px solid #2581c7;" cellspacing="1" cellpadding="1">
                <tr>
                    <td class="DarkBackground" align="left" nowrap>
                        <font face="Verdana" size="+1"><fmt:message key="monitor.common.action"/></font>
                    </td>
                </tr>
                <tr>
                    <td bgcolor="#FFFFFF" nowrap>
                        &nbsp;<br />
                        <ul>
                        <li><a onclick="document.addServer.action.value='testAddServerConnection'; document.addServer.mode.value='edit'; if(validate()) document.addServer.submit();" href="#"><fmt:message key="monitor.server.testSetting"/></a></li>
                        </ul>
                        &nbsp;<br />
                    </td>   
                </tr>
            </table>
            
        </td>
        </form>      
    </tr>
</table>





