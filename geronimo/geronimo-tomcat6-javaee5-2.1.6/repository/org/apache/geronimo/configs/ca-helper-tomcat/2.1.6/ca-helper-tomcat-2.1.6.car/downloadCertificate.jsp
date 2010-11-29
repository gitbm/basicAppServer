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

<%-- $Rev: 582981 $ $Date: 2007-10-08 17:31:46 -0400 (Mon, 08 Oct 2007) $ --%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Download Certificate</title>
<script language="JavaScript">
    function validateForm() {
        obj = document.forms[0].csrId;
        if(obj.value == '') {
            alert('csrId can not be empty');
            obj.focus();
            return false;
        }
        return true;
    }
</script>
</head>
<body>
<h2>Download Personal Certificate</h2>
<p>This page enables you to download and install a certificate issued to you by the CA.  Before installing your personal certificate,
install the CA's certificate in your web browser by visiting <a href="downloadCACertificate.jsp">this link</a>.</p>

<form action="installPersonalCertificate.jsp" method="post">
    <table border="0">
        <tr>
            <th align="right">CSR Id:</th>
            <td>
                <input type="text" name="csrId" size="20" maxlength="200"/>
            </td>
        </tr>
    </table>
    <input type="submit" value="Download Certificate" onClick="return validateForm();"/>
    <input type="reset" name="reset" value="Reset"/>
</form>
<a href="<%=request.getContextPath()%>">Cancel</a>
</body>
</html>
