<%@page contentType="text/html" pageEncoding="UTF-8" import="mypack.*,java.sql.*" session="false"%>
<%
//response.addHeader("cache-control", "no-cache");  

try{
Authorized a=new Authorized(request, response);
if(a.isValidSession())
    {
	if(a.getuser().equals("Farmer"))
	{
    response.sendRedirect("farmer_home.jsp");
    return;
    }
	if(a.getuser().equals("Retailer"))
	{
    response.sendRedirect("retailer_home.jsp");
    return;
    }
	if(a.getuser().equals("WholeSaler"))
	{
    response.sendRedirect("wholesaler_home.jsp");
    return;
    }
	if(a.getuser().equals("Civilian"))
	{
    response.sendRedirect("civilian_home.jsp");
    return;
    }
	if(a.getuser().equals("Admin"))
	{
    response.sendRedirect("admin_home.jsp");
    return;
    }
	if(a.getuser().equals("Computer Administrator"))
	{
    response.sendRedirect("Computeradministrator_home.jsp");
    return;
    }
}
}
catch(Exception e)
{
	e.printStackTrace();
}
%>

<!DOCTYPE HTML>
<html lang="en-US">

<head>
<title>Welcome to Golden Crop</title>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="style.css"  />
<!--[if IE 7]><link rel="stylesheet" type="text/css" href="style/css/ie7.css" media="all" /><![endif]-->
<script type="text/javascript" src="style/js/jquery-1.5.min.js"></script>
<script type="text/javascript" src="style/js/ddsmoothmenu.js"></script>
<script type="text/javascript" src="style/js/scripts.js"></script>
<script type="text/javascript" src="scripts/swfobject/swfobject.js"></script>


<link rel="stylesheet" href="search/jquery-ui-css.css" />
  <script src="search/jquery-1.8.3.js"></script>
  <script src="search/jquery-ui.js"></script>
  <script>
  	$(document).ready(function()
	{

		$('#Vegetables, #Cereals, #Fruits').fadeTo('slow',0.25);
		
		$('.selection, .cereals, .fruits').click(function()
		{
				
			
			
			var sel = $(this).text();
			if(sel === 'Vegetables')
			{	
				
				$('#Vegetables').fadeTo('slow',1);
				$('#Vegetables :checkbox').removeAttr('disabled');
				
				$('#Cereals').fadeTo('slow',0.25);
				$('#Cereals :checkbox').attr('disabled','true');
				$('#Fruits').fadeTo('slow',0.25);
				$('#Fruits :checkbox').attr('disabled', 'true');	
			}

			if(sel === 'Cereals')
			{
				$('#Cereals').fadeTo('slow',1);
				$('#Cereals :checkbox').removeAttr('disabled');	
				
				$('#Vegetables').fadeTo('slow',0.25);
				$('#Vegetables :checkbox').attr('disabled', 'true');
				$('#Fruits').fadeTo('slow',0.25);
				$('#Fruits :checkbox').attr('disabled', 'true');
			}
			
			if(sel === 'Fruits')
			{
				$('#Fruits').fadeTo('slow',1);
				$('#Fruits :checkbox').removeAttr('disabled');	
				
				$('#Cereals').fadeTo('slow',0.25);
				$('#Cereals :checkbox').attr('disabled','true');
				$('#Vegetables').fadeTo('slow',0.25);
				$('#Vegetables :checkbox').attr('disabled', 'true');
			}
			
		});
	});
  </script>


<script>
$(document).ready(function()
	{

		$('#Indore, #Bhopal, #Mumbai').fadeTo('slow',0.25);
		
		$('.ind, .bhp, .mum').click(function()
		{
			var sel = $(this).text();
			if(sel === 'Indore')
			{
				$('#Indore').fadeTo('slow',1);
				$('#Indore :checkbox').removeAttr('disabled');
				
				$('#Bhopal').fadeTo('slow',0.25);
				$('#Bhopal :checkbox').attr('disabled','true');
				$('#Mumbai').fadeTo('slow',0.25);
				$('#Mumbai :checkbox').attr('disabled', 'true');	
			}

			if(sel === 'Bhopal')
			{
				$('#Bhopal').fadeTo('slow',1);
				$('#Bhopal :checkbox').removeAttr('disabled');	
				
				$('#Indore').fadeTo('slow',0.25);
				$('#Indore :checkbox').attr('disabled', 'true');
				$('#Mumbai').fadeTo('slow',0.25);
				$('#Mumbai :checkbox').attr('disabled', 'true');
			}
			
			if(sel === 'Mumbai')
			{
				$('#Mumbai').fadeTo('slow',1);
				$('#Mumbai :checkbox').removeAttr('disabled');	
				
				$('#Bhopal').fadeTo('slow',0.25);
				$('#Bhopal :checkbox').attr('disabled','true');
				$('#Indore').fadeTo('slow',0.25);
				$('#Indore :checkbox').attr('disabled', 'true');
			}
			
		});
	});
  </script>

<script>
var previousCheckId;

     function toggle(chkBox) {
         if (chkBox.checked) {
              if (previousCheckId) {
                   document.getElementById(previousCheckId).checked = false;
              }
              previousCheckId = chkBox.getAttribute('id');
         }
     }
</script>


<script>
var previousCheckId1;

     function toggle1(chkBox) {
         if (chkBox.checked) {
              if (previousCheckId1) {
                   document.getElementById(previousCheckId1).checked = false;
              }
              previousCheckId1 = chkBox.getAttribute('id');
         }
     }
</script>


<script>
var previousCheckId2;

     function toggle2(chkBox) {
         if (chkBox.checked) {
              if (previousCheckId2) {
                   document.getElementById(previousCheckId2).checked = false;
              }
              previousCheckId2 = chkBox.getAttribute('id');
         }
     }
</script>


<style>
body{ font-family:"Trebuchet MS", Arial, Helvetica, sans-serif;}
ul li{ list-style:none;}
#main-page{ width:800px; height:513px; margin:auto;background-color:#cccccc; border:1px solid #333; }
#top-cont{ width:800px; height:50px; margin:auto;background-color:#fff;border-bottom:1px solid #d1d1d1;}
#middle-cont{ width:800px; height:100px; margin:auto;background-color:#fff; }
#middle-container{width:800px; height:300px; margin:auto;background-color:#FFF; border-bottom:1px solid #d1d1d1; overflow:auto;}
#bottom-cont{ width:800px; height:50px; margin:auto;background-color:#fff; }
.menu{ margin-left:-42px; padding:0;}
.menu ul li{ list-style:none; float:left;margin-left:3px;}
.menu ul li a{font-size:14px; text-decoration:none;color:#535353; background-color:#ebebeb;border:1px solid #d1d1d1; padding:7px;}
.menu ul li a:hover{color:#ffffff; background-color:#303030;border:1px solid #999;}


#menu-div{ margin:0; padding:0px;height:26px;border-bottom:1px solid #d1d1d1;}
#menu-div ul{ margin:0; padding:0px; }
#menu-div ul li{ list-style:none; float:left;margin-left:3px;}
#menu-div ul li a{font-size:16px; text-decoration:none;color:#000; background-color:#fff;border:1px solid #d1d1d1; padding:3px; font-style:bold;}
#menu-div ul li a:hover{color:#535353; background-color:#ebebeb;border:1px solid #999;}


#td1 p{
	font-size:14px;
	text-decoration:none;
	color:#535353;
	background-color:#ebebeb;
	border:1px solid #d1d1d1;
	text-align:center;
	padding-top:4px;
	
	
}
#td1 p:hover {
	color:#fff;
	background-color:#282828;
	border:1px solid #999;
}
.style1 {
	margin-left: 51px;
	margin-top: 0;
}
.style2 {
	margin-top: 8;
}
.style3 {
	margin-left: 50px;
}
.style4 {
	margin-left: 143;
}
.style5 {
	margin-left: 6;
}
.style6 {
	margin-left: 0;
}
.style7 {
	margin-left: 22;
}
.style8 {
	margin-top: 0;
	margin-left: 56;
}
</style>




</head>






<body>
<div id="container">
  <!-- Begin Header Wrapper -->
  <div id="page-top">
    <div id="header-wrapper">
      <!-- Begin Header -->
      <div id="header">
        <div id="logo"><a href="index.jsp"><img src="style/images/goldencrop_logo.jpg" alt="" /></a></div>
        <!-- Logo -->
        <!-- Begin Menu -->
        <div id="menu-wrapper">
          <div id="smoothmenu1" class="ddsmoothmenu">
            <ul>
              <li><a href="index.jsp" class="selected">Home</a></li>
			  <li><a href="login.html">Login</a></li>
			  <li><a href="services.html">Services</a></li>
			  
              <li><a href="faqs.html">FAQs</a></li>
              <li><a href="gallery.html">Gallery</a></li>
              <li><a href="feedback.html">Feedback</a></li> 
              <li><a href="aboutus.html">About Us</a></li>
              <li><a href="contactus.html">Contact Us</a></li>
            </ul>
          </div>
        </div>
        <!-- End Menu -->
      </div>
      <!-- End Header -->
    </div>
   
                        
  </div>
  <!-- End Header Wrapper -->
  <!-- Begin Slider -->
  
  
    

 
  <!-- End Slider -->
  
  <font size="7" color="green"><strong><h4><%String msg=request.getParameter("msg");
					if(msg!=null){
    				%>
			   <!-- whose profile indicator-->
     <div id="portfolio">
      
      <ul class="gallerynav">
        
        <li>
        <label>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<%=msg%></label>
        </li>
      </ul>
      </div>
				<%
}
    %>                         </h4></strong></font>
  
   
   
 
  
  
  
  
  <div  id="main-page">
<div id="top-cont">
<table border="0" width="100%" >
<tr><br></br>
<td width="70%" style="padding-left:250px;" valign="top" ><p style="color:#F00; font-size:18px">Customize your search for best prices</td><td width="30%" align="right"  valign="middle"></td></tr>
</table>
</div>
<div id="middle-cont">
<table border="0" width="100%" style="">
<tr>
<td align="left" style="border-right:1px solid #d1d1d1; padding-left:20px; width: 40%;">
<div style="margin:auto;">
<table border="0">
<tr><td align="center" style="color:#333; font-size:18px; height: 28px; width: 243px;">Whom to search..? </td></tr>
<tr><td align="left" style="width: 243px">
<label>
<form action="search.jsp" method="post">
                  <table border="0" class="style8" style="height: 27px; width: 294px;">
                    <tr>
                      <td id="td1"><p>Farmers
                        <input type="checkbox" name="emandi1" value="Farmer" id="chkBox000" onClick="toggle1(this);"></p></td>
                      <td id="td1" ><p>Wholesalers
                        <input type="checkbox" name="emandi1" value="WholeSaler" id="chkBox001" onClick="toggle1(this);"></p></td>
                        <td id="td1" ><p>Retailers
                        <input type="checkbox" name="emandi1" value="Retailer" id="chkBox002" onClick="toggle1(this);"></p></td>
                       </tr>
                  </table>
             <br></br><div class="menu">
                  </div>
                  </label>
</td></tr>
</table></div>

</td>

<td width="30%" style="border-right:1px solid #d1d1d1;margin-top:-20;">
<div class="style1">
<table border="0">
<tr><td align="center"  valign="top" style="color:#333; font-size:18px; ">What to Search..? </td></tr>
<tr><td align="center">
<div class="menu">
<br></br>
<ul class="style2" style="height: 36px">
<li class="selection" ><a href="#">Vegetables</a></li>
<li class="cereals"><a href="#">Cereals</a></li>
<li class='fruits'><a href="#">Fruits</a></li>
</ul></div>

</td></tr>
</table></div>


</td>
<div style="margin:auto;">
<td width="30%" >
<div class="style3">
<table border="0">
<tr><td align="center" style="color:#333; font-size:18px;">Where to search..? </td></tr>
<tr><td align="center">
<div class="menu" style="height: 24px">
<br></br>
<ul>
<li class="ind"><a href="#">Indore</a></li>
<li class="bhp"><a href="#">Bhopal</a></li>
<li class="mum"><a href="#">Mumbai</a></li>
</ul></div>

</td></tr>
</table></div>


</td>
</tr>


</table>


</div>
<div id="middle-container"> 
<div id="tabs">
  <ul>
    <li><a href="#fragment-1"><span><strong>Category</strong></span></a></li>
    <li><a href="#fragment-2"><span><strong>Mandi</strong></span></a></li>

  </ul>
  <div id="fragment-1">
    <table border="0" class="style4">
    <tr><td valign="top" style="width: 253px">
    <div id="Vegetables">
    <ul>
    <li><input type="checkbox" name="emandi" value="Amranth" disabled="true" id="chkBox100" onClick="toggle(this);">Amranth</li>
    <li><input type="checkbox" name="emandi" value="Arrowroot" disabled="true" id="chkBox101" onClick="toggle(this);">Arrowroot</li>
    <li><input type="checkbox" name="emandi" value="Asparagus" disabled="true" id="chkBox102" onClick="toggle(this);">Asparagus</li>
    <li><input type="checkbox" name="emandi" value="Bell Pepper" disabled="true" id="chkBox103" onClick="toggle(this);">Bell Pepper</li>
    <li><input type="checkbox" name="emandi" value="Bitter Gourd" disabled="true" id="chkBox104" onClick="toggle(this);">Bitter Gourd</li>
    <li><input type="checkbox" name="emandi" value="Bottle Gourd" disabled="true" id="chkBox105" onClick="toggle(this);">Bottle Gourd</li>
    <li><input type="checkbox" name="emandi" value="Cabbage" disabled="true" id="chkBox106" onClick="toggle(this);">Cabbage</li>
    <li><input type="checkbox" name="emandi" value="Carrot" disabled="true" id="chkBox107" onClick="toggle(this);">Carrot</li>
    <li><input type="checkbox" name="emandi" value="Cauliflower" disabled="true" id="chkBox108" onClick="toggle(this);">Cauliflower</li>
    <li><input type="checkbox" name="emandi" value="Chili" disabled="true" id="chkBox109" onClick="toggle(this);">Chili</li>
    <li><input type="checkbox" name="emandi" value="Cluster Beans" disabled="true" id="chkBox110" onClick="toggle(this);">Cluster Beans</li>
    <li><input type="checkbox" name="emandi" value="Colocasia" disabled="true" id="chkBox111" onClick="toggle(this);">Colocasia</li>
    <li><input type="checkbox" name="emandi" value="Coriander Cilantro" disabled="true" id="chkBox112" onClick="toggle(this);">Coriander Cilantro</li>
    <li><input type="checkbox" name="emandi" value="Cucumber" disabled="true" id="chkBox113" onClick="toggle(this);">Cucumber</li>
    <li><input type="checkbox" name="emandi" value="Drumstick leaves" disabled="true" id="chkBox114" onClick="toggle(this);">Drumstick leaves</li>
    <li><input type="checkbox" name="emandi" value="Gherkins" disabled="true" id="chkBox115" onClick="toggle(this);">Gherkins</li>
    <li><input type="checkbox" name="emandi" value="Green chilli" disabled="true" id="chkBox116" onClick="toggle(this);">Green chilli</li>
    <li><input type="checkbox" name="emandi" value="Lettuce" disabled="true" id="chkBox117" onClick="toggle(this);">Lettuce</li>
    <li><input type="checkbox" name="emandi" value="Lemon" disabled="true" id="chkBox118" onClick="toggle(this);">Lemon</li>
    <li><input type="checkbox" name="emandi" value="Maize" disabled="true" id="chkBox119" onClick="toggle(this);">Maize</li>
    <li><input type="checkbox" name="emandi" value="Mushrooms" disabled="true" id="chkBox120" onClick="toggle(this);">Mushrooms</li>
    <li><input type="checkbox" name="emandi" value="Olives" disabled="true" id="chkBox121" onClick="toggle(this);">Olives</li>
    <li><input type="checkbox" name="emandi" value="Onion" disabled="true" id="chkBox122" onClick="toggle(this);">Onion</li>
    <li><input type="checkbox" name="emandi" value="Peas" disabled="true" id="chkBox123" onClick="toggle(this);">Peas</li> 
    <li><input type="checkbox" name="emandi" value="Potato" disabled="true" id="chkBox124" onClick="toggle(this);">Potato</li>
    <li><input type="checkbox" name="emandi" value="Pumpkin" disabled="true" id="chkBox125" onClick="toggle(this);">Pumpkin</li>
    <li><input type="checkbox" name="emandi" value="Radish" disabled="true" id="chkBox129" onClick="toggle(this);">Radish</li>
    <li><input type="checkbox" name="emandi" value="Spinach" disabled="true" id="chkBox126" onClick="toggle(this);">Spinach</li>
    <li><input type="checkbox" name="emandi" value="Sweet potato" disabled="true" id="chkBox127" onClick="toggle(this);">Sweet potato</li>
    <li><input type="checkbox" name="emandi" value="Tomato" disabled="true" id="chkBox128" onClick="toggle(this);">Tomato</li>
    </ul></div>
    
    </td>
    
    
    <td valign="top" style="width: 272px">
    <div id="Cereals">
    <ul>
     <li>
                    <input type="checkbox" name="emandi" value="Barley" disabled="true" id="chkBox201" onClick="toggle(this);">
                    Barley</li>
                  <li>
                    <input type="checkbox" name="emandi" value="Broken Wheat" disabled="true" id="chkBox202" onClick="toggle(this);">
                    Broken Wheat</li>
                  <li>
                    <input type="checkbox" name="emandi" value="Maize" disabled="true" id="chkBox203" onClick="toggle(this);">
                    Maize</li>
                  <li>
                    <input type="checkbox" name="emandi" value="Pearl Millet" disabled="true" id="chkBox204" onClick="toggle(this);">
                    Pearl Millet</li>
                  <li>
                    <input type="checkbox" name="emandi" value="Rice" disabled="true" id="chkBox205" onClick="toggle(this);">
                    Rice</li>
                  <li>
                    <input type="checkbox" name="emandi" value="Rice Flakes" disabled="true" id="chkBox206" onClick="toggle(this);">
                    Rice Flakes</li>
                  <li>
                    <input type="checkbox" name="emandi" value="Sago" disabled="true" id="chkBox207" onClick="toggle(this);">
                    Sago</li>
                  <li>
                    <input type="checkbox" name="emandi" value="Semolina" disabled="true" id="chkBox208" onClick="toggle(this);">
                    Semolina</li>
                  <li>
                    <input type="checkbox" name="emandi" value="Sorghum" disabled="true" id="chkBox209" onClick="toggle(this);">
                    Sorghum</li>
                  <li>
                    <input type="checkbox" name="emandi" value="Vermicilli" disabled="true" id="chkBox210" onClick="toggle(this);">
                    Vermicilli</li>
                  <li>
                    <input type="checkbox" name="emandi" value="Wheat" disabled="true" id="chkBox211" onClick="toggle(this);">
                    Wheat</li>
                  <li>
                    <input type="checkbox" name="emandi" value="Pigeon Peas" disabled="true" id="chkBox212" onClick="toggle(this);">
                    Pigeon Peas</li>
                  <li>
                    <input type="checkbox" name="emandi" value="Split Chick Peas" disabled="true" id="chkBox213" onClick="toggle(this);">
                    Split Chick Peas</li>
                  <li>
                    <input type="checkbox" name="emandi" value="Black Gram" disabled="true" id="chkBox214" onClick="toggle(this);">
                    Black Gram</li>
                  <li>
                    <input type="checkbox" name="emandi" value="White Chick Peas" disabled="true" id="chkBox215" onClick="toggle(this);">
                    White Chick Peas</li>
                  <li>
                    <input type="checkbox" name="emandi" value="Split Green Gram" disabled="true" id="chkBox216" onClick="toggle(this);">
                    Split Green Gram</li>
    </ul></div>
    
    </td>
    
    
    <td valign="top" style="width: 152px">
    <div id="Fruits" >
    <ul>
    <li>
                    <input type="checkbox" name="emandi" value="Apple" disabled="true" id="chkBox301" onClick="toggle(this);">
                    Apple</li>
                  <li>
                    <input type="checkbox" name="emandi" value="Apricot" disabled="true" id="chkBox302" onClick="toggle(this);">
                    Apricot</li>
                  <li>
                    <input type="checkbox" name="emandi" value="Banana" disabled="true" id="chkBox303" onClick="toggle(this);">
                    Banana</li>
                  <li>
                    <input type="checkbox" name="emandi" value="Black Berry" disabled="true" id="chkBox304" onClick="toggle(this);">
                    Black Berry</li>
                  <li>
                    <input type="checkbox" name="emandi" value="Chickoo" disabled="true" id="chkBox305" onClick="toggle(this);">
                    Chickoo</li>
                  <li>
                    <input type="checkbox" name="emandi" value="Custard apple" disabled="true" id="chkBox306" onClick="toggle(this);">
                    Custard apple</li>
                  <li>
                    <input type="checkbox" name="emandi" value="Dates" disabled="true" id="chkBox307" onClick="toggle(this);">
                    Dates</li>
                  <li>
                    <input type="checkbox" name="emandi" value="Figs" disabled="true" id="chkBox308" onClick="toggle(this);">
                    Figs</li>
                  <li>
                    <input type="checkbox" name="emandi" value="Grapes" disabled="true" id="chkBox309" onClick="toggle(this);">
                    Grapes</li>
                  <li>
                    <input type="checkbox" name="emandi" value="Guavas" disabled="true" id="chkBox310" onClick="toggle(this);">
                    Guavas</li>
                  <li>
                    <input type="checkbox" name="emandi" value="Jackfruit" disabled="true" id="chkBox311" onClick="toggle(this);">
                    Jackfruit</li>
                  <li>
                    <input type="checkbox" name="emandi" value="Mango" disabled="true" id="chkBox312" onClick="toggle(this);">
                    Mango</li>
                  <li>
                    <input type="checkbox" name="emandi" value="Orange" disabled="true" id="chkBox313" onClick="toggle(this);">
                    Orange</li>
                  <li>
                    <input type="checkbox" name="emandi" value="Pappaya" disabled="true" id="chkBox314" onClick="toggle(this);">
                    Pappaya</li>
                  <li>
                    <input type="checkbox" name="emandi" value="Pear" disabled="true" id="chkBox315" onClick="toggle(this);">
                    Pear</li>
                  <li>
                    <input type="checkbox" name="emandi" value="Plum" disabled="true" id="chkBox316" onClick="toggle(this);">
                    Plum</li>
                  <li>
                    <input type="checkbox" name="emandi" value="Pineapple" disabled="true" id="chkBox317" onClick="toggle(this);">
                    Pineapple</li>
                  <li>
                    <input type="checkbox" name="emandi" value="Watermelon" disabled="true" id="chkBox318" onClick="toggle(this);">
                    Watermelon</li>
    </ul></div>
    
    </td>
    
    
    
    </tr></table>
    
  </div>
  
  
  
  
  <div id="fragment-2">
   <table border="0">
    <tr><td valign="top" style="width: 253px">
    <div id="Indore">
    <ul>
<li>
                    <input type="checkbox" value="ind_Airport Road" disabled="true" id="chkBox401" onClick="toggle2(this);">
                    Airport Road</li>
                  <li>
                    <input type="checkbox" value="ind_Bhawarkua Square" disabled="true" id="chkBox402" onClick="toggle2(this);">
                    Bhawarkua Square</li>
                  <li>
                    <input type="checkbox" value="ind_Choitram Road" disabled="true" id="chkBox403" onClick="toggle2(this);">
                    Choitram Road</li>
                  <li>
                    <input type="checkbox" value="ind_Bengali Square" disabled="true" id="chkBox404" onClick="toggle2(this);">
                    Bengali Square</li>
                  <li>
                    <input type="checkbox" value="ind_Patnipura" disabled="true" id="chkBox405" onClick="toggle2(this);">
                    Patnipura
                  <li>
                    <input type="checkbox" value="ind_Vijay Nagar" disabled="true" id="chkBox406" onClick="toggle2(this);">
                    Vijay Nagar</li>
                  <li>
                      </ul></div>
    
    </td>
    
    
    <td valign="top" style="width: 253px">
    <div id="Bhopal">
    <ul>
<li>
                    <input type="checkbox" value="bhp_Baigargarh" disabled="true" id="chkBox501" onClick="toggle2(this);">
                    Baigargarh</li>
                  <li>
                    <input type="checkbox" value="bhp_Hamidia Road" disabled="true" id="chkBox502" onClick="toggle2(this);">
                    Hamidia Road</li>
                  <li>
                    <input type="checkbox" value="bhp_Jail Road" disabled="true" id="chkBox503" onClick="toggle2(this);">
                    Jail Road</li>
                  <li>
                    <input type="checkbox" value="bhp_Mahavir Nagar" disabled="true" id="chkBox504" onClick="toggle2(this);">
                    Mahavir Nagar</li>
                  <li>
                    <input type="checkbox" value="bhp_Satpuda Extension" disabled="true" id="chkBox505" onClick="toggle2(this);">
                    Satpuda Extension</li>
                  <li>
                    <input type="checkbox" value="bhp_Shahjahanabad" disabled="true" id="chkBox506" onClick="toggle2(this);">
                    Shahjahanabad</li>
                   </ul></div>
    
    </td>
    
    
    <td valign="top">
    <div id="Mumbai">
    <ul>
    <li>
                    <input type="checkbox" value="mum_Andheri East" disabled="true" id="chkBox601" onClick="toggle2(this);">
                    Andheri East</li>
                  <li>
                    <input type="checkbox" value="mum_Borivali West" disabled="true" id="chkBox602" onClick="toggle2(this);">
                    Borivali West</li>
                  <li>
                    <input type="checkbox" value="mum_Goregaon" disabled="true" id="chkBox603" onClick="toggle2(this);">
                    Goregaon</li>
                  <li>
                    <input type="checkbox" value="mum_Juhu" disabled="true" id="chkBox604" onClick="toggle2(this);">
                    Juhu</li>
                  <li>
                    <input type="checkbox" value="mum_Nariman Point" disabled="true" id="chkBox605" onClick="toggle2(this);">
                    Nariman Point</li>
                  <li>
                    <input type="checkbox" value="mum_Powai" disabled="true" id="chkBox606" onClick="toggle2(this);">
                    Powai</li>
                  <li>
                    <input type="checkbox" value="mum_Thane" disabled="true" id="chkBox607" onClick="toggle2(this);">
                    Thane</li>
                  <li>
                    <input type="checkbox" value="mum_Worli" disabled="true" id="chkBox608" onClick="toggle2(this);">
                    Worli</li>
                  </ul></div>
    
    </td>
    
    
    
    </tr>
    
    </table>
    
  </div>
  

  
  
  
  
</div>

<script>
$( "#tabs" ).tabs();
</script>


</div>
<div id="bottom-cont" align="right" style="padding-top:10px;">
  <input type="submit" value="Submit" class="button gray stripe" style="left: 629px; top: 0px; width: 109px">
</form>
<div id="bottom-cont" align="left" style="padding-top:10px;">
<a href="search_mandi.html"><strong><h4>Search Mandi</h4></strong></a>
</div>
</div>

</div>

      <p>&nbsp;</p>
  


  <div class="clearfix"></div>
  <!-- Begin Footer -->
  <div id="footer-wrapper">
    <div id="footer">
      <div id="footer-content">
        <!-- Begin Copyright -->
        <div id="copyright">
          <p>Copyright Â© Team Quark Returns 2013. All Rights Reserved | <a href="privacypolicy.html">Privacy Policy</a></p>
        </div>
        <!-- End Copyright -->
        <!-- Begin Social Icons -->
        <div id="socials">
          <ul>
            
            <li><a href="https://twitter.com/TeamGoldenCrop" target="_blank"><img src="style/images/icon-twitter.png" alt="" /></a></li>
            <li><a href="http://www.linkedin.com/profile/view?id=241184443&trk=tab_pro0" target="_blank"><img src="style/images/linkedin.png" alt="" /></a></li>
            <li><a href="#" target="_blank"><img src="style/images/google+.jpg" alt="" /></a></li>
            <li><a href="http://www.facebook.com/pages/Golden-Crop/158136257679840" target="_blank"><img src="style/images/icon-facebook.png" alt="" /></a></li>
          </ul>
        </div>
        <!-- End Social Icons -->
      </div>
    </div>
  </div>
  <!-- End Footer -->
</div>
</body>
</html>