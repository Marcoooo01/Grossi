<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ page import = "java.io.*,java.util.*, java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <title>LOGIN</title>
    </head>
    <body>
     <% 
            try {
                
            String connectionUrl = "jdbc:sqlserver://213.140.22.237\\SQLEXPRESS:1433;databaseName=XFactor;user=grossi.marco;password=xxx123#";

            // l'istruzione seguente è fondamentale altrimenti non viene caricato il driver

            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            // Load SQL Server JDBC driver and establish connection.
            Connection connection = DriverManager.getConnection(connectionUrl);

            //inserimento di un nuovo giudice
            String username = request.getParameter("username");
            String sql = "DELETE FROM Evento WHERE ";
            PreparedStatement prepStmt = connection.prepareStatement(sql);
            prepStmt.setString(1, username);
            prepStmt.setString(2, password);
            ResultSet rs = prepStmt.executeQuery();
            if (rs.next())
            {
                String sql2 = "SELECT Nome From Evento INNER JOIN Comunicazione ON Evento.ID = Comunicazione.IDE INNER JOIN Cittadino ON Comunicazione.IDC = Cittadino.ID WHERE username = ?";
                PreparedStatement prepStmt2 = connection.prepareStatement(sql2);
                prepStmt2.setString(1, username);
                
                out.print("<table>");
			
			    out.print("<tr><th align=center>Nome</th></tr>");
			
    		    while(rs.next()){

				String Nome = rs.getString("Nome");
                
                out.print("<tr><td><a href=Es1cancella.jsp>" + Nome + "</a></td></tr>");

	        }
	        
	        out.print("</table>");
            }
            else
            {
                out.println("Ma chi sei?!?");
            }
            rs.close();
            connection.close();
            } catch(Exception e){
                out.println(e);
            } %>
    </body>
</html>