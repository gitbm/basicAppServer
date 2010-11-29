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

<%-- $Rev: 781081 $ $Date: 2009-06-02 13:00:57 -0400 (Tue, 02 Jun 2009) $ --%>

<%@ page import="org.apache.geronimo.console.util.PortletManager"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/portlet" prefix="portlet"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:setBundle basename="consolebase"/>
<portlet:defineObjects/>

<script language="JavaScript">
var <portlet:namespace/>formName = "<portlet:namespace/>ChangePasswordForm";
var <portlet:namespace/>requiredFields = new Array("password", "newPassword");
var <portlet:namespace/>passwordFields = new Array("newPassword");
function <portlet:namespace/>validateForm(){
    if(!textElementsNotEmpty(<portlet:namespace/>formName,<portlet:namespace/>requiredFields))
        return false;
    if(!passwordElementsConfirm(<portlet:namespace/>formName, <portlet:namespace/>passwordFields)) {
        return false;
    }
    return true;
}
</script>

<jsp:include page="_header.jsp" /><br>

<c:choose>
    <c:when test="${!empty(alias)}">
        <b><fmt:message key="keystore.changePassword.changePwdForPriKey"/>&nbsp;${alias}</b><br/>
    </c:when>
    <c:otherwise>
        <b><fmt:message key="keystore.changePassword.changePwdForKeystore"/>&nbsp;${keystore}</b><br/>
    </c:otherwise>
</c:choose>

<form name="<portlet:namespace/>ChangePasswordForm" action="<portlet:actionURL/>" method="POST">
    <input type="hidden" name="keystore" value="${keystore}" />
    <input type="hidden" name="alias" value="${alias}" />
    <input type="hidden" name="mode" value="${mode}" />
    <table border="0">
        <tr>
            <th align="right"><fmt:message key="keystore.changePassword.oldPassword"/>:</th>
            <td>
                <input type="password" name="password" size="20" maxlength="200" />
            </td>
        </tr>
        <tr>
            <th align="right"><fmt:message key="keystore.changePassword.newPassword"/>:</th>
            <td>
                <input type="password" name="newPassword" size="20" maxlength="200" />
            </td>
        </tr>
        <tr>
            <th align="right"><fmt:message key="keystore.changePassword.confirmPassword"/>:</th>
            <td>
                <input type="password" name="confirm-newPassword" size="20" maxlength="200" />
            </td>
        </tr>
    </table>
    <input type="submit" value="<fmt:message key="keystore.changePassword.changePassword"/>" onClick="return <portlet:namespace/>validateForm();"/>
</form>

<c:choose>
    <c:when test="${!empty(alias)}">
        <p><a href="<portlet:actionURL portletMode="view">
                        <portlet:param name="mode" value="certificateDetails-before" />
                        <portlet:param name="id" value="${keystore}" />
                        <portlet:param name="alias" value="${alias}" />
                    </portlet:actionURL>"><fmt:message key="consolebase.common.cancel"/></a></p>
    </c:when>
    <c:otherwise>
        <p><a href="<portlet:actionURL portletMode="view">
                        <portlet:param name="mode" value="viewKeystore-before" />
                        <portlet:param name="id" value="${keystore}" />
                    </portlet:actionURL>"><fmt:message key="consolebase.common.cancel"/></a></p>
    </c:otherwise>
</c:choose>
