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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="portlet" uri="http://java.sun.com/portlet" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:setBundle basename="systemdatabase"/>
<portlet:defineObjects/>

<%-- TODO: Check if datasource is created --%>
<%-- Datasource --%>
<c:if test="${ds == null}">
    <%-- Create the connection manually --%>
    <sql:setDataSource
      var="ds"
      driver="org.apache.derby.jdbc.EmbeddedDriver"
      url="jdbc:derby:${db};create=true"
      user=""
      password=""
    />
</c:if>

<%-- Select statement --%>
<sql:transaction dataSource="${ds}">
  <sql:query var="table">
    select * from ${tbl}
  </sql:query>
</sql:transaction>

<center><b><fmt:message key="internaldb.common.DB"/>: <c:out value="${db}" />&nbsp;&nbsp;&nbsp;<fmt:message key="internaldb.common.table"/>: <c:out value="${tbl}" /></b></center>
<table width="100%">
  <tr>
  <%-- Get the column names for the header of the table --%>
  <c:forEach var="columnName" items="${table.columnNames}">
    <td class="DarkBackground"><c:out value="${columnName}" /></td>
  </c:forEach>
  </tr>
  
  <%-- Check if there are table data to display --%>
  <c:choose>
    <c:when test="${table.rowCount == 0}">
      <tr>
        <td class="LightBackground" colspan="<c:out value='${fn:length(table.columnNames)}' />" align="center">*** <fmt:message key="internaldb.common.empty"/> ***</td>
      </tr>
    </c:when>
    <c:otherwise>
      <%-- Get the value of each column while iterating over rows --%>
      <c:forEach var="row" items="${table.rowsByIndex}" varStatus="status">
        <jsp:useBean type="javax.servlet.jsp.jstl.core.LoopTagStatus" id="status" />
        <tr>
        <c:choose>
          <c:when test="<%= status.getCount() % 2 == 1 %>">
            <c:forEach var="column" items="${row}">
              <td class="LightBackground"><c:out value="${column}" /></td>
            </c:forEach>
          </c:when>
            <c:otherwise>
            <c:forEach var="column" items="${row}">
              <td class="MediumBackground"><c:out value="${column}" /></td>
            </c:forEach>
            </c:otherwise>
          </c:choose>
        </tr>
      </c:forEach>
    </c:otherwise>
  </c:choose>
</table>

<br>
<a href="<portlet:actionURL portletMode="view">
           <portlet:param name="action" value="listTables" />
           <portlet:param name="db" value="${db}" />
           <portlet:param name="viewTables" value="${viewTables}" />
         </portlet:actionURL>"><fmt:message key="internaldb.common.viewTables"/>
</a>
&nbsp;&nbsp;|&nbsp;&nbsp;
<a href="<portlet:actionURL portletMode="view">
           <portlet:param name="action" value="listDatabases" />
         </portlet:actionURL>"><fmt:message key="internaldb.common.viewDatabases"/>
</a>
