<%@ page
    import="java.sql.*, java.io.*, javax.servlet.*, javax.servlet.http.*" %>
    <%

HttpSession httpSession = request.getSession();
if(httpSession==null || httpSession.getAttribute("user")==null){
	response.sendRedirect("login.jsp");
	return;
	
	
}


String user=(String)httpSession.getAttribute("user");

%>
    

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ministore</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <%
        String name = request.getParameter("name");
        double price = 0;
        String size = request.getParameter("size");
        String colour = request.getParameter("colour");
        String storage = request.getParameter("storage");
        String ram = request.getParameter("ram");
        String highlight = request.getParameter("highlight");
        String description = request.getParameter("description");
        String specification = request.getParameter("specification");

        try {
            price = Double.parseDouble(request.getParameter("price"));
        } catch (NumberFormatException e) {
            out.println("<div class=\"alert alert-danger\" role=\"alert\">Error: Invalid number format.</div>");
        }

        if (name == null || name.isEmpty() || colour == null || colour.isEmpty()) {
            out.println("<div class=\"alert alert-danger\" role=\"alert\">Error: Name and colour are required.</div>");
        } else {
            Connection conn = null;
            String url = "jdbc:mysql://localhost:3306/ministore"; // Replace with your MySQL database URL
            String username = "root"; // Replace with your MySQL username
            String password = ""; // Replace with your MySQL password

            try {
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection(url, username, password);

                // Inserting data into the database
                String sql = "INSERT INTO products (name, price, size, colour, storage, ram, highlight, description, specification) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement statement = conn.prepareStatement(sql);
                statement.setString(1, name);
                statement.setDouble(2, price);
                statement.setString(3, size);
                statement.setString(4, colour);
                statement.setString(5, storage);
                statement.setString(6, ram);
                statement.setString(7, highlight);
                statement.setString(8, description);
                statement.setString(9, specification);

                int rowsInserted = statement.executeUpdate();
                if (rowsInserted > 0) {
                    out.println("<div class=\"alert alert-success\" role=\"alert\">Product added successfully.</div>");
                } else {
                    out.println("<div class=\"alert alert-danger\" role=\"alert\">Failed to add product.</div>");
                }

            } catch (Exception e) {
                out.println("<div class=\"alert alert-danger\" role=\"alert\">Error: " + e.getMessage() + "</div>");
            } finally {
                try {
                    if (conn != null) {
                        conn.close();
                    }
                } catch (SQLException e) {
                    out.println("<div class=\"alert alert-danger\" role=\"alert\">Error closing the database connection: " + e.getMessage() + "</div>");
                }
            }
        }
        %>
    </div>
    <!-- Include Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
