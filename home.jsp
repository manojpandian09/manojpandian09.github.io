<%@ page import="java.sql.*" import="java.util.*" %>

<!DOCTYPE HTML>
<html>
<head>
	<title>Home</title>

	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<!-- styles sheet links -->
	<link rel="stylesheet" href="container2-styles.css">
</head>
<body style="background-color: grey;">



<%

	ArrayList<String> name=new ArrayList();
	ArrayList<String> desc=new ArrayList();

	try{
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","MANOJKUMAR","MANOJ");
	PreparedStatement ps=con.prepareStatement("select * from amindia");
	ResultSet rs=null;

	rs=ps.executeQuery();

	while(rs.next()){
		name.add(rs.getString(1));
		desc.add(rs.getString(2));
	}
}
catch(Exception e){

		out.println(e);
}

%>
	

<h1 style="background-color:red;position: sticky;top: 0px;">AutoMobilesIndia</h1>

<div class="search-container">
	<p>search container</p>
</div>


<div class="upcoming-container">
</div>


<div class="latest-container">
	
	<div class="latest-header">
		<h1> New Arraivals
	</div>

	<div class="content-border">

		<div class="product-container">


<%

int i=0

while(name.length()<i){ 

%>

			<div class="product-border">
				
					<div class="product">
						<h3 style="background-color :black;color: white; position: relative;padding: 2px;"></h3>
						<img src="mustangbg.jpg" style="width: 100%;">
						<p>
						</p>
					</div>

			</div>

<%
			i++;
}

%>


		</div>

	</div>

	<button onclick="plusDivs(-1)" class="prev">&#10094</button>
	<button onclick="plusDivs(1)" class="next">&#10095</button>

</div>





<script>
var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("product-border");
  if (n > x.length) {slideIndex = 1}
  if (n < 1) {slideIndex = x.length}
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";  
  }
  x[slideIndex-1].style.display = "block";  
}
</script>

</body>
</html>