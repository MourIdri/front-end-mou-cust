<html>
<head>
<Title>Registration Form</Title>
<style type="text/css">
    body { background-color: #fff; border-top: solid 10px #000;
        color: #333; font-size: .85em; margin: 20; padding: 20;
        font-family: "Segoe UI", Verdana, Helvetica, Sans-Serif;
    }
    h1, h2, h3,{ color: #000; margin-bottom: 0; padding-bottom: 0; }
    h1 { font-size: 2em; }
    h2 { font-size: 1.75em; }
    h3 { font-size: 1.2em; }
    table { margin-top: 0.75em; }
    th { font-size: 1.2em; text-align: left; border: none; padding-left: 0; }
    td { padding: 0.25em 2em 0.25em 0em; border: 0 none; }
</style>
</head>
<body>
<h3> REGISTER</h3>


<form method=POST action="cgi-bin/checkout.py">
<fieldset style="width:750px">
<legend> Attendees Personnal data </legend>
        <br>
        <fieldset style="width:700px">
        <legend>Register with your details</legend>
        <label>Enter your First Name :<input type="text" name="FirstName" size="30"></label><br>
        <label>Enter your Last Name  :<input type="text" name="LastName" size="30"></label><br>
        <label>Enter your current Company :<input type="text" name="CurrentCompany" size="30"></label><br>
        <label>Enter your mail :<input type="text" name="CurrentMail" size="30"></label><br>
        <label>Enter your Job Role :<input type="text" name="JobRole" size="30"></label><br>
        </fieldset>
        <br>
</fieldset>
<P><B></B>
<P><B></B>
<P><input type=submit value="submit"> 
 <input type=reset value="reset">
</form>

<a type="button" href='index.php'>back...</a>

</body>
</html>
