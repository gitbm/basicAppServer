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

<%-- $Rev: 609207 $ $Date: 2008-01-05 15:22:33 -0500 (Sat, 05 Jan 2008) $ --%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:setBundle basename="consolebase"/>

<b><fmt:message key="repository.usage.title" >
<fmt:param  value="${res}"/>
</fmt:message>
</b>
  
<p>
<fmt:message key="repository.usage.content" >
<fmt:param  value="${res}"/>
</fmt:message>
</b>
<pre>
    &lt;environment&gt;
        ...
        &lt;dependencies&gt;
            ...
            &lt;dependency&gt;
                &lt;groupId&gt;${groupId}&lt;/groupId&gt;
                &lt;artifactId&gt;${artifactId}&lt;/artifactId&gt;
                &lt;version&gt;${version}&lt;/version&gt;
                &lt;type&gt;${type}&lt;/type&gt;
            &lt;/dependency&gt;
       &lt;/dependencies&gt;
    &lt;/environment&gt;
</pre>

<p><a onClick="history.go(-1); return false;" href=""><fmt:message key="consolebase.common.back"/></a>
