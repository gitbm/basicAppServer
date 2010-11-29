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

<%-- $Rev: 738138 $ $Date: 2009-01-27 11:38:23 -0500 (Tue, 27 Jan 2009) $ --%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.security.cert.Certificate" %>
<%@ page import="org.apache.geronimo.ca.helper.util.CAHelperUtils"%>
<%@ page import="org.apache.geronimo.crypto.CaUtils"%>
<%@ page import="org.apache.geronimo.crypto.CertificateUtil"%>
<%@ page import="org.apache.geronimo.management.geronimo.*"%>
<%@ page import="java.math.BigInteger"%>
<%
    String csrId = request.getParameter("csrId");
    CertificateRequestStore certReqStore = CAHelperUtils.getCertificateRequestStore();
    BigInteger sNo = certReqStore.getSerialNumberForRequest(csrId);
    String base64Cert = null;
    String fpSHA1 = null;
    String fpMD5 = null;
    if(sNo != null) {
        CertificateStore certStore = CAHelperUtils.getCertificateStore();
        Certificate cert = certStore.getCertificate(sNo);
        request.setAttribute("cert", cert);
        base64Cert = CaUtils.base64Certificate(cert);
        fpSHA1 = CertificateUtil.generateFingerprint(cert, "SHA1");
        fpMD5 = CertificateUtil.generateFingerprint(cert, "MD5");
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Install Personal Certificate</title>
</head>
<body>
<h2>Install Personal Certificate</h2>
<p>This page enables you to download and install a personal certificate into your web browser.</p>

<%if(sNo == null) {%>
Either the CSR is yet to be fulfilled or the csrId <%=csrId%> is invalid.
<%} else {%>
<SCRIPT LANGUAGE="VBScript">
<!--
Sub Install_Onclick
    certificate = document.installForm.cert.value
    On Error Resume Next
    Dim Enroll

    Set Enroll = CreateObject("CEnroll.CEnroll.2")
    if ( (Err.Number = 438) OR (Err.Number = 429) ) Then
        Err.Clear
        Set Enroll = CreateObject("CEnroll.CEnroll.1")
    End If
    if Err.Number <> 0 then
        MsgBox("Error in creating CEnroll object.  error:" & Hex(err))
    Else
        Call Enroll.acceptPKCS7(certificate)
        If err.Number <> 0 then
            MsgBox("Certificate installation failed.  error: "& Hex(err))
        Else
            MsgBox("Certificate installed sucessfully")
        End if
    End If
End sub
-->
</SCRIPT>

To install your certificate into Internet Explorer, click on the <i>Install Certificate</i> button below.
For other web browsers, click on <a href="DownloadCertificateServlet?csrId=<%=csrId%>">this link</a>.
<form method="POST">
    <input type="button" value="Install Certificate" onClick="Install_Onclick()"/>
</form>

<br><b>Base64 encoded Certificate Text</b>
<br>
<form name="installForm" method="POST">
    <textarea name="cert" rows="10" cols="80" READONLY><%=base64Cert%></textarea>
</form>

    <table border="0">
        <tr>
            <th colspan="2" align="left">Certificate Details</th>
        </tr>
        <tr>
            <th align="right">Finger Prints</th>
            <td>SHA1 &nbsp; <%=fpSHA1%> <br>MD5 &nbsp; <%=fpMD5%></td>
        </tr>
        <tr>
            <th align="right">Version:</th>
            <td>${cert.version}</td>
        </tr>
        <tr>
            <th align="right">Subject:</th>
            <td>${cert.subjectDN.name}</td>
        </tr>
        <tr>
            <th align="right">Issuer:</th>
            <td>${cert.issuerDN.name}</td>
        </tr>
        <tr>
            <th align="right">Serial Number:</th>
            <td>${cert.serialNumber}</td>
        </tr>
        <tr>
            <th align="right">Valid From:</th>
            <td>${cert.notBefore}</td>
        </tr>
        <tr>
            <th align="right">Valid To:</th>
            <td>${cert.notAfter}</td>
        </tr>
        <tr>
            <th align="right">Signature Alg:</th>
            <td>${cert.sigAlgName}</td>
        </tr>
        <tr>
            <th align="right">Public Key Alg:</th>
            <td>${cert.publicKey.algorithm}</td>
        </tr>
        <tr>
            <th align="right" valign="top">cert.toString()</th>
            <td><pre>${cert}</pre></td>
        </tr>
    </table>
<%}%>
<br><a href="<%=request.getContextPath()%>">Back to CA Helper home</a>

</body>
</html>
