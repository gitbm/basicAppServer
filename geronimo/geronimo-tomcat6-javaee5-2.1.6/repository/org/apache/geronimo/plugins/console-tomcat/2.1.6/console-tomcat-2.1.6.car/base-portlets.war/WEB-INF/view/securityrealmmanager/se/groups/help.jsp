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
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:setBundle basename="consolebase"/>
<p><fmt:message key="securityrealmmanager.se.groups.help.title" /></p>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="150" align="right" valign="top" class="MediumBackground" style="padding: 10px 10px 10px 5px; color: #1E1E52;"><fmt:message key="consolebase.common.groupName"/></td>
    <td class="LightBackground" style="padding: 10px 5px 10px 10px" valign="top"><fmt:message key="securityrealmmanager.common.groupNameExp" /></td>
  </tr>
  <tr>
    <td width="150" align="right" valign="top" class="MediumBackground" style="padding: 10px 10px 10px 5px; color: #1E1E52;"><fmt:message key="consolebase.common.users"/></td>
    <td class="LightBackground" style="padding: 10px 5px 10px 10px" valign="top"><fmt:message key="securityrealmmanager.se.groups.help.usersExp" /></td>
  </tr>
  <tr>
    <td width="150" align="right" valign="top" class="MediumBackground" style="padding: 10px 10px 10px 5px;"><img src="/console/images/add.gif" alt="Add"/></td>
    <td class="LightBackground" style="padding: 10px 5px 10px 10px" valign="top"><fmt:message key="securityrealmmanager.se.groups.help.addNewGroupBtnExp" /></td>
  </tr>
  <tr>
    <td width="150" align="right" valign="top" class="MediumBackground" style="padding: 10px 10px 10px 5px;"><img src="/console/images/cancel.gif" alt="Cancel"/></td>
    <td class="LightBackground" style="padding: 10px 5px 10px 10px" valign="top"><fmt:message key="securityrealmmanager.se.groups.help.cancelNewGroupBtnExp" /></td>
  </tr>
</table>
