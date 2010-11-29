<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Phone Book</title>
    </head>
    <body>

        <!--The Heading of the Phone Book Page-->
        <h1 align=center>Phone Book</h1>
     
        <BR>
        <BR>
        <!-- The table containing phone book cotents. -->
   
        <TABLE border="1" width="100%">
                
            <TH width="5%" align=center>Select</TH>
            <TH width="25%" align=center>Name</TH>
            <TH width="15%" align=center>Home Phone</TH>
            <TH width="15%" align=center>Work Phone</TH>
            <TH width="15%" align=center>Cell Phone</TH>
            <TH width="25%" align=center>Email</TH>
                
            <!-- Some static entries. Will be replaced with dynamic content in following tutorials -->
            <TR>
                <TD align=center><input type=checkbox name=cb_1 alt="Select to Delete" align="middle"></TD>
                <TD align=center>Adam Clark</TD>
                <TD align=center>1 978 234 7839</TD>
                <TD align=center>1 978 134 7830</TD>
                <TD align=center>1 978 378 7578</TD>
                <TD align=center>adam@clark.com</TD>
            </TR>                
            <TR>
                <TD align=center><input type=checkbox name=cb_2 alt="Select to Delete" align="middle"></TD>
                <TD align=center>Charlie Smearlas</TD>
                <TD align=center>1 617 456 6783</TD>
                <TD align=center>1 617 290 3556</TD>
                <TD align=center>1 617 980 2467</TD>
                <TD align=center>charlie@gmail.com</TD>
            </TR>            
            <TR>
                <TD align=center><input type=checkbox name=cb_2 alt="Select to Delete" align="middle"></TD>
                <TD align=center>Don Brownie</TD>
                <TD align=center>1 345 333 5680</TD>
                <TD align=center>1 533 290 3556</TD>
                <TD align=center>1 678 980 2837</TD>
                <TD align=center>don@brownie.com</TD>
            </TR>
            <TR>
                <TD align=center><input type=checkbox name=cb_2 alt="Select to Delete" align="middle"></TD>
                <TD align=center>Harry potter</TD>
                <TD align=center>1 221 456 6453</TD>
                <TD align=center>1 567 389 2356</TD>
                <TD align=center>1 908 354 2467</TD>
                <TD align=center>harry@potter.com</TD>
            </TR>
            
            
        </TABLE>
 
        <BR>
        <BR>
        
        <table align=center>       
            <!-- The row containing command buttons -->
            <TR align=center>
                <TD><input type=button name="Add" value="Add an Entry"></TD> 
                <TD><input type=button name="Modify" value="Save Modifications"></TD>
                <TD><input type=button name="Delete" value="Delete Selected Entries"></TD>
            </TR>
        </table>
    </body>
    <BR><BR><BR><BR><BR><BR>
    <jsp:include page="/WEB-INF/jsp/footer.jsp" />
</html>
