<!-- Important Dates -->
{{- define "dates" -}}
	   <table class="table">
	   <tbody>
	     <tr><td>Paper Submission Due:</td><td><del>July 30, 2020</del><a style="color: #ED6FA2">&ensp;August 20, 2020</a></td></tr>
	     <tr><td>Notification of Acceptance:</td><td>September 20, 2020</td></tr>
	     <tr><td>Camera-ready Paper Due:</td><td>October 1, 2020</td></tr>
	     <tr><td>Early+Author Registration Deadline:</td><td>October 1, 2020</td></tr>
	     <tr><td>Conference:</td><td>December 7-10, 2020</td></tr>
	   </tbody>
	   </table>
{{- end -}}

<!-- Covid Notice -->
{{- define "covid" -}}
	<h2>Covid-19 Statement</h2>
	<p class="lead">Due to the rapidly changing Covid-19 situation globally, both UCC 2020 and BDCAT 2020 will take place on-line. All papers in the main track and the workshops will be delivered on-line. The registration fees have been adapted to reflect this change. All peer-reviewed accepted papers will appear in the proceedings published by IEEE.</p>
{{- end -}}

<!-- meta tags -->
{{- define "meta" -}}
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Specific tags -->
    <meta name="keywords" content="BDCAT 2020, Big Data Computing, Applications and Technologies, conference, university of leicester" />
    <meta name="description" content="BDCAT 2020, 7th IEEE/ACM International Conference on Big Data Computing, Applications and Technologies" />

    <!-- Icon -->
    <link rel="icon" href="/static/images/cloud.svg">
{{- end -}}

<!-- Stylesheets -->
{{- define "css" -}}
    <link rel="stylesheet" href="/static/css/bootstrap.min.css">
 
{{- end -}}

<!-- Javascript libraries -->
{{- define "js" -}}
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="/static/js/jquery-3.2.1.slim.min.js"></script>
    <script src="/static/js/popper.min.js"></script>
    <script src="/static/js/bootstrap.min.js"></script>
    <script src="/static/js/particles.js"></script>
    <script src="/static/js/particles-app.js"></script>
{{- end -}}

<!-- Custom styles -->
{{- define "styles" -}}
  <style>
    .container-fluid { padding-right: 0; padding-left: 0 }
    canvas { position: absolute; background-color: #1B194D;}
    .navbar { background-color: #1C2C63; }
    .dropdown-menu { background-color: #1C2C63;  }
    #menu {color: #C7DBF0}
    #footbar { background-color: #1C2C63; }
    #notices { background-color: #666f97b0; color: white; }
    .jumbotron-fluid { background-color: #C7DBF0; color: #1C2D63; }
  </style>
{{- end -}}

<!-- Navigation bar -->
{{- define "navbar" -}}
  <!-- Navigation bar -->
  <div class="container">
    <nav class="navbar navbar-expand-lg fixed-top">
      <a id="menu" class="navbar-brand offset-md-2" href="/home">BDCAT2020</a>
      <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
        <ul class="navbar-nav">

          <!-- Programme dropdown -->
	  <li class="nav-item dropdown">
          	<a id="menu" class="nav-link dropdown-toggle" href="/programme" id="navbarProgramme" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Programme</a>
	  	<div id="menu" class="dropdown-menu" aria-labelledby="navbarProgramme">
          		<a id="menu" class="dropdown-item disabled" href="/workshops">Workshops</a>
          		<a id="menu" class="dropdown-item disabled" href="/keynotes">Keynotes</a>
          		<a id="menu" class="dropdown-item disabled" href="/doctoral">Doctoral Symposium</a>
          		<a id="menu" class="dropdown-item disabled" href="/tutorials">Tutorials</a>
		</div>
          </li>

	  <li class="nav-item active"><a id="menu" class="nav-link" href="/cfp">Calls</a></li>
	  <li class="nav-item"><a id="menu" class="nav-link active" href="/registration">Registration</a></li>
          <li class="nav-item"><a id="menu" class="nav-link active" href="/committee">Committees</a></li>
        </ul>
      </div>
    </nav>
  </div>
{{- end -}}

<!-- Social links -->
{{- define "social" -}}
   <!-- Social and legal links -->
   <div id="footbar" class="container-fluid">
   <div class="row align-items-end">
        <div class="col-6 offset-md-2" style="padding-top: 10px">
        <p class="lead"><a href="https://www.ieee.org/security-privacy.html" style="color: grey;">IEEE Privacy Policy</a></p>
        </div>
        <div class="col-4">
        <p class="lead"><a href="https://twitter.com/ucc_bdcat" style="color: grey;"><img src="/static/images/twitter-brands.svg" height="25px"></i> BDCAT 2020 microblog</a></p>
        </div>
   </div>
   </div>
{{- end -}}
