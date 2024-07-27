<%@ page import="java.sql.*"%>
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
    <title>Ministore</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body class="p-3 m-0 border-0 bd-example m-0 border-0">
   
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header bg-primary text-white">
                        <h4 class="mb-0">Add Phone Record</h4>
                    </div>
                    <div class="card-body">
                        <form method="post" action="addProductservice.jsp" onsubmit="return validateForm()">
                            <div class="form-group">
                                <label for="name">Phone Name</label>
                                <input type="text" class="form-control" id="name" name="name" placeholder="Enter phone name">
                            </div>
                          
                            <div class="form-group">
                                <label for="price">Price</label>
                                <input type="number" step="0.01" class="form-control" id="price" name="price" placeholder="Enter price">
                            </div>
                            <div class="form-group">
                                <label for="size">Size</label>
 <select class="form-control" id="size" name="size">
             <option value="">Select Size</option>
 
            <option value="64GB">64GB</option>
            <option value="128GB">128GB</option>
            <option value="256GB">256GB</option>
            <option value="512GB">512GB</option>
        </select>                            </div>
                              <div class="form-group">
        <label for="colour">Color</label>
        <select class="form-control" id="colour" name="colour">
                    <option value="">Select Color</option>
        
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
        <select class="form-control" id="storage" name="storage">
                    <option value="">Select Storage</option>
        
            <option value="64GB">64GB</option>
            <option value="128GB">128GB</option>
            <option value="256GB">256GB</option>
            <option value="512GB">512GB</option>
        </select>
    </div>
                            <div class="form-group">
        <label for="ram">RAM</label>
        <select class="form-control" id="ram" name="ram">
                    <option value="">Select Ram</option>
        
            <option value="6GB">6GB</option>
            <option value="8GB">8GB</option>
            <option value="12GB">12GB</option>
        </select>
    </div>
                            <div class="form-group">
                                <label for="highlight">Highlights</label>
                                <textarea class="form-control" id="highlight" name="highlight" rows="3" placeholder="Enter highlights"></textarea>
                            </div>
                            <div class="form-group">
                                <label for="description">Description</label>
                                <textarea class="form-control" id="description" name="description" rows="3" placeholder="Enter description"></textarea>
                            </div>
                            <div class="form-group">
                                <label for="specification">Specification</label>
                                <textarea class="form-control" id="specification" name="specification" rows="3" placeholder="Enter specification"></textarea>
                            </div>
                            <div class="form-group">
                                <label for="image">Image</label>
                                <input type="file" class="form-control-file" id="image" name="image">
                            </div>
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script>
function validateForm() {
    // Get form elements
    var name = document.getElementById('name').value.trim();
    var price = document.getElementById('price').value;
    var size = document.getElementById('size').value.trim();
    var colour = document.getElementById('colour').value.trim();
    var storage = document.getElementById('storage').value.trim();
    var ram = document.getElementById('ram').value.trim(); // Removed specific validation
    var highlight = document.getElementById('highlight').value.trim();
    var description = document.getElementById('description').value.trim();
    var specification = document.getElementById('specification').value.trim();
    var image = document.getElementById('image').value.trim();

    // Regular expression to check if the first letter is capitalized
    var capitalizedRegex = /^[A-Z]/;

    // Validate required fields and first letter capitalization
    if (name === "" || !capitalizedRegex.test(name)) {
        alert("Please enter the phone name with the first letter capitalized.");
        document.getElementById('name').focus();
        return false;
    }
    if (price === "" || price <= 0) {
        alert("Please enter a valid price.");
        document.getElementById('price').focus();
        return false;
    }
    if (size === "") {
        alert("Please select a size.");
        document.getElementById('size').focus();
        return false;
    }
    if (colour === "") {
        alert("Please select a color.");
        document.getElementById('colour').focus();
        return false;
    }
    if (storage === "") {
        alert("Please select storage.");
        document.getElementById('storage').focus();
        return false;
    }
    // Removed specific validation for ram
    if (ram === "") {
        alert("Please select RAM.");
        document.getElementById('ram').focus();
        return false;
    }
    if (highlight === "" || !capitalizedRegex.test(highlight)) {
        alert("Please enter the highlights with the first letter capitalized.");
        document.getElementById('highlight').focus();
        return false;
    }
    if (description === "" || !capitalizedRegex.test(description)) {
        alert("Please enter the description with the first letter capitalized.");
        document.getElementById('description').focus();
        return false;
    }
    if (specification === "" || !capitalizedRegex.test(specification)) {
        alert("Please enter the specification with the first letter capitalized.");
        document.getElementById('specification').focus();
        return false;
    }
    if (image === "") {
        alert("Please select an image.");
        document.getElementById('image').focus();
        return false;
    }

    // If all validations pass, allow form submission
    return true;
}
</script>


</body>
</html>
