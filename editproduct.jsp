
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.ProductDAO, bean.Product"%>
 <% HttpSession httpSession = request.getSession();
if(httpSession==null || httpSession.getAttribute("user")==null){
	response.sendRedirect("login.jsp");
	return;
	
	
}


String user=(String)httpSession.getAttribute("user");

%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Ministore</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center mb-4">Edit Product</h2>
        <% 
            int id = Integer.parseInt(request.getParameter("id"));
            ProductDAO productDAO = new ProductDAO();
            Product product = productDAO.getProductById(id);

            if (product == null) {
                out.println("<div class='alert alert-danger'>Product not found!</div>");
            } else {
        %>
        <form action="updateProduct.jsp" method="post">
            <input type="hidden" name="id" value="<%= product.getId() %>">
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" class="form-control" id="name" name="name" value="<%= product.getName() %>" required>
            </div>
            <div class="form-group">
                <label for="price">Price:</label>
                <input type="number" step="0.01" class="form-control" id="price" name="price" value="<%= product.getPrice() %>" required>
            </div>
            <div class="form-group">
                <label for="size">Size</label>
                <select class="form-control" id="size" name="size" required>
                     <option value="64GB">64GB</option>
            <option value="128GB">128GB</option>
            <option value="256GB">256GB</option>
            <option value="512GB">512GB</option>
                </select>
            </div>
            <div class="form-group">
                <label for="colour">Color:</label>
 <label for="colour">Color</label>
                <select class="form-control" id="colour" name="colour" required>
                     <option value="Space Gray">Space Gray</option>
            <option value="Silver">Silver</option>
            <option value="Gold">Gold</option>
            <option value="Midnight Green">Midnight Green</option>
            <option value="Pacific Blue">Pacific Blue</option>
            <option value="Red">Red</option>
            <option value="White">White</option>
                </select>       
                     </div>
                     <div class="form-group">
                <label for="storage">Storage</label>
                <select class="form-control" id="storage" name="storage" required>
                     <option value="64GB">64GB</option>
            <option value="128GB">128GB</option>
            <option value="256GB">256GB</option>
            <option value="512GB">512GB</option>
                </select>
            </div>
            <div class="form-group">
                <label for="ram">Ram</label>
                <select class="form-control" id="ram" name="ram" required>
                     <option value="6GB">6GB</option>
            <option value="8GB">8GB</option>
            <option value="12GB">12GB</option>
                </select>
            </div>
            <div class="form-group">
                <label for="highlight">Highlight:</label>
                <textarea class="form-control" id	="highlight" name="highlight" required><%= product.getHighlight() %></textarea>
            </div>
            
            <div class="form-group">
                <label for="description">Description:</label>
                <textarea class="form-control" id="description" name="description" required><%= product.getDescription() %></textarea>
            </div>
            <div class="form-group">
                <label for="specification">Specification:</label>
                <textarea class="form-control" id="specification" name="specification" required><%= product.getSpecification() %></textarea>
            </div>
            <div class="form-group">
                <label for="image_url">Image URL:</label>
                <input type="text" class="form-control" id="image_url" name="image_url" value="<%= product.getImage_url() %>" required>
            </div>
            <button type="submit" class="btn btn-primary">Update</button>
        </form>
        <% } %>
    </div>

    <!-- Bootstrap JS (optional) -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
