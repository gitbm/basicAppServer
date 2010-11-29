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

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/portlet" prefix="portlet"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/CommonMsg.tld" prefix="CommonMsg" %>
<fmt:setBundle basename="plancreator-portlet"/>
<portlet:defineObjects />

<CommonMsg:commonMsg/><br>

<form enctype="multipart/form-data" name="<portlet:namespace/>GetArchiveForm" action="<portlet:actionURL/>" method="POST">
  <input type="hidden" name="mode" value="index-after" />
<table>
  <tr>
    <th align="right"><fmt:message key="plancreator.archive.archive"/>:</th>
    <td><input type="file" name="moduleURI" value="" /></td>
  </tr>
  <tr></tr>
  <tr>
    <td><input type="submit" value='<fmt:message key="plancreator.archive.config"/>' /></td>
  </tr>
</table>
</form>
