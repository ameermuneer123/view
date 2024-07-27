<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>

<%
HttpSession httpSession = request.getSession();
if(httpSession == null || httpSession.getAttribute("user") == null){
    response.sendRedirect("login.jsp");
    return;
}

String user = (String)httpSession.getAttribute("user");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Products</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <nav class="navbar navbar-expand-lg bg-body-tertiary">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Ministore</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
                aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavDropdown">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link" href="#">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Contact</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">My Orders</a></li>
                    <li class="nav-item"><a class="nav-link" href="viewCart.jsp">Cart</a></li>
                </ul>
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                            data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <div class="profile-icon">
                                <i class="fas fa-user-circle"></i>
                            </div>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                            <span class="dropdown-item-text"><b><%=user%></b></span>
                            <a class="dropdown-item" href="#">Edit Profile</a>
                            <a class="dropdown-item" href="logout.jsp">Logout</a>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container mt-5">
        <div class="row">
            <div class="col-md-12">
                <h4 class="mb-4">Product List</h4>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Price</th>
                            <th>Colour</th>
                            <th>Size</th>
                            <th>Storage</th>
                            <th>RAM</th>
                            <th>Highlight</th>
                            <th>Description</th>
                            <th>Specification</th>
                            <th>Image</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        String url = "jdbc:mysql://localhost:3306/ministore";
                        String username = "root";
                        String password = "";
                        Connection conn = null;
                        Statement stmt = null;
                        ResultSet rs = null;

                        try {
                            Class.forName("com.mysql.jdbc.Driver");
                            conn = DriverManager.getConnection(url, username, password);
                            stmt = conn.createStatement();
                            String sql = "SELECT id, name, price, size, colour, storage, ram, image_url, highlight, description, specification FROM products";
                            rs = stmt.executeQuery(sql);

                            while (rs.next()) {
                                int id = rs.getInt("id");
                                String name = rs.getString("name");
                                double price = rs.getDouble("price");
                                String size = rs.getString("size");
                                String colour = rs.getString("colour");
                                String storage = rs.getString("storage");
                                String ram = rs.getString("ram");
                                String image = rs.getString("image_url");
                                String highlight = rs.getString("highlight");
                                String description = rs.getString("description");
                                String specification = rs.getString("specification");
                        %>
                        <tr>
                            <td><%=name%></td>
                            <td><%=price%></td>
                            <td><%=colour%></td>
                            <td><%=size%></td>
                            <td><%=storage%></td>
                            <td><%=ram%></td>
                            <td><%=highlight%></td>
                            <td><%=description%></td>
                            <td><%=specification%></td>
                            <td><img src="<%=image%>" alt="<%=name%>" style="width: 250px; height: 150px;"></td>
                            <td>
                                <a href="editproduct.jsp?id=<%=id%>" class="btn btn-sm btn-warning">Edit</a>
                                
                            </td>
                            <td>
                            <a href="deleteproduct.jsp?id=<%=id%>" class="btn btn-sm btn-danger">Delete</a>
                            </td>
                        </tr>
                        <%
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        } finally {
                            if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
                            if (stmt != null) try { stmt.close(); } catch (SQLException ignore) {}
                            if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
                        }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
