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
<fmt:setBundle basename="consolebase"/>
<portlet:defineObjects/>

<table width="100%" cellspacing="5">
    ${message}
    <tr>
        <td><a href="<portlet:actionURL portletMode="view"><portlet:param name="action" value="new"/></portlet:actionURL>"><fmt:message key="securityrealmmanager.derby.users.maximized.createNewUser"/></a> </td>
        <td >&nbsp;</td>
    </tr>
        <tr>
            <td><fmt:message key="consolebase.common.userName"/></td>
            <td>&nbsp;</td>
            
        </tr>
    <c:forEach var="user" items="${users}">
        <tr>
            <td><a href="<portlet:actionURL portletMode="view"><portlet:param name="action" value="edit"/><portlet:param name="userId" value="${user.key}"/></portlet:actionURL>">${user.key}</a></td>
            
            <td><a href="<portlet:actionURL><portlet:param name="userId" value="${user.key}"/><portlet:param name="action" value="delete"/></portlet:actionURL>" onclick="return confirm('Confirm Delete?');"><fmt:message key="consolebase.common.delete"/></a></td>
        </tr>
    </c:forEach>

</table>
