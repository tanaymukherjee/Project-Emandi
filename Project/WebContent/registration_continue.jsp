
<%@page contentType="text/html" pageEncoding="UTF-8" import="mypack.*,java.sql.*" session="false"%>
<%
//response.addHeader("cache-control", "no-cache");  
response.setHeader("Cache-Control", "no-cache"); //Forces caches to obtain a new copy of the page from the origin server  
response.setHeader("Cache-Control", "no-store"); //Directs caches not to store the page under any circumstance  
response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"  
response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward compatibility  
Authorized a=new Authorized(request, response);
if(!a.isValidSession())
    {
    response.sendRedirect("index.jsp");
    return;
}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Registration Form</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="description" content="Fancy Sliding Form with jQuery" />
        <meta name="keywords" content="jquery, form, sliding, usability, css3, validation, javascript"/>
        <link rel="stylesheet" href="css/style.css" type="text/css" media="screen"/>
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
        <script type="text/javascript" src="sliding.form.js"></script>       <script type="text/javascript" src="js/statecity.js"></script>
        
        
        
        <script type="text/javascript">
function fifa()
{
    var frm = document.forms[0];
    var abc = frm.browsers.value;
    if (abc === "farmer")
{
        	frm.tagname.value = "You selected A";
		frm.tagname.disabled=true;
}
    else if (abc === "wholesaler")
{
        frm.tagname.value = "Enter your Reg NO.";
}
  else if (abc === "retailer")
{
        frm.tagname.value = "Enter your Reg NO.";
}

    else
{
        	frm.text1.disabled=true;

}
}</script>
        
    </head>
    <style>
        span.reference{
            position:fixed;
            left:5px;
            top:5px;
            font-size:10px;
            text-shadow:1px 1px 1px #fff;
        }
        span.reference a{
            color:#555;
            text-decoration:none;
			text-transform:uppercase;
        }
        span.reference a:hover{
            color:#000;
            
        }
        h1{
            color:#ccc;
            font-size:36px;
            text-shadow:1px 1px 1px #fff;
            padding:20px;
        }
    </style>
    <body>
                <div id="content">
            <h1>Registration Form</h1>
            <div id="wrapper">
                <div id="steps">
                    <form id="formElem" name="formElem" action="registration_continue1.jsp" method="post">
                        <fieldset class="step">
                            <legend>Account</legend>
                            <p>
                                <label for="username">Full name</label>
                                <input id="username1" name="username1" readonly="readonly" AUTOCOMPLETE=OFF value="<%=a.getname()%>"/>
                            </p>
                            <p>
                                <label for="email">Email</label>
                                <input id="email1" name="email1" readonly="readonly" placeholder="info@tympanus.net" type="email" AUTOCOMPLETE=OFF  value="<%=a.getemailid()%>"/>
                            </p>
                            <p>
                                <label for="password">New Password</label>
                                <input id="password1" name="password1" type="password" AUTOCOMPLETE=OFF />
                            </p>
 							 <p>
                                <label for="password">Confirm Password</label>
                                <input id="password" name="password" type="password" AUTOCOMPLETE=OFF />
                            </p>
 
                        </fieldset>
                        <fieldset class="step">
                                                     <legend>Personal Details</legend>
                            <p>
                                                               
                                <label for="gender">Gender</label>
                                <select id="cardtype" name="gender1">
                                    <option value="Male">Male</option>
                                    <option value="Female">Female</option>
                                   </select>

                            </p>
                            <p>
                                <label for="country">DOB</label>
                               <input type="text" placeholder="e.g. 02-10-1991" name="SelectedDate" id="SelectedDate" >                            </p>
                            <p>
                                <label for="phone">Mobile No.</label>
                                <input id="phone" name="phone" readonly="readonly" placeholder="e.g. +351215555555" type="tel" AUTOCOMPLETE=OFF  value="<%=a.getmobno()%>"/>
                            </p>
                            <p>
                                <label for="website">LandLine NO.</label>
                                <input id="llno" name="llno" placeholder="e.g. 07314038595" type="tel" AUTOCOMPLETE=OFF />
                            </p>
                        </fieldset>
                        <fieldset class="step">
                           
                           <legend>Address</legend>
                            
                            
                             <p>
                                <label for="cardnumber">Address</label>
                                <input id="cardnumber" name="cardnumber" type="number" AUTOCOMPLETE=OFF />
                            </p>
                            
                                 <p>  <label for="cardtype">State</label>
                                <select id="state1" name="state1" onChange="setCities1();" style="width: 210px">
                                    <option value="" > --- Select State ---</option>
                           <option>Andhra Pradesh</option><option>Arunachal Pradesh</option><option> A n N Islands</option><option>Assam</option><option>Bihar</option><option>Chandigarh</option><option>Chhattisgarh</option><option>Dadra and Nagar Haveli</option><option>Daman and Diu</option><option>Delhi</option><option>Goa</option>
<option>Gujarat</option><option>Haryana</option><option>Himachal Pradesh</option><option>Jammu and Kashmir</option><option>Jharkhand</option><option>Karnataka</option><option>Kerala</option><option>Lakshadweep</option><option>Madhya Pradesh</option><option>Maharashtra</option>
<option>Manipur</option><option>Meghalaya</option><option>Mizoram</option><option>Nagaland</option><option>Orissa</option><option>Pondicherry</option><option>Punjab</option><option>Rajasthan</option><option>Sikkim</option><option>Tamil Nadu</option><option>Tripura</option>
<option>Uttar Pradesh</option><option>Uttarakhand(Uttaranchal) </option><option>West Bengal</option></select>                                </select>
                            </p>
                           
                            <p>
                                <label for="secure">City</label>
                                <select name="city1" id="city1" style="width: 210px"><option value="">---Select City---</option> </select>
                            </p>
                            <p>
                                <label for="namecard">Pincode</label>
                                <input id="namecard" name="namecard" type="text" AUTOCOMPLETE=OFF />
                            </p>                        </fieldset>
                        <fieldset class="step">
                            <legend>Settings</legend>
                            <p>
                                <label for="newsletter">Newsletter</label>
                                <select id="newsletter" name="newsletter">
                                    <option value="" selected>Please Select</option>
                                    <option value="Yes">Yes</option>
                                     <option value="No">No</option>
                                </select>
                            </p>
                            <p>
                                <label for="updates">User</label>
                                <select id="updates" name="updates" onchange="fifa()">
                                    <option value="" selected>Please Select</option>
                                    <option value="Farmer">Farmer</option>
                                    <option value="Wholesaler">Wholesaler</option>
                                    <option value="Retailer">Retailer</option>
                                    <option value="Civilian">Civilian</option>
						<option value="Computer Administrator">Computer Administrator</option>
                                </select>
                            </p>
							<p>
                                <label for="tagname">Registration No.</label>
                                <input id="tagname" name="tagname" type="text" AUTOCOMPLETE=OFF />
                            </p>
                        </fieldset>
						<fieldset class="step">
                            <legend>Confirm</legend>
							<p>
								I hereby assure that all the details filled here are true to my knowledge and hence I take the responsibility if there is any violation of mandatory details. I give an affirmation to my availibility to donate blood for the needy and promise to cultivate this good deed to the highest of regard.							</p>
                            <p class="submit">
                                <button id="registerButton" type="submit">Register</button>
                            </p>
                        </fieldset>
                    </form>
                </div>
                <div id="navigation" style="display:none;">
                    <ul>
                        <li class="selected">
                            <a href="#">Account</a>
                        </li>
                        <li>
                            <a href="#">Personal Details</a>
                        </li>
                        <li>
                            <a href="#">Address</a>
                        </li>
                        <li>
                            <a href="#">Settings</a>
                        </li>
						<li>
                            <a href="#">Confirm</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </body>
</html>