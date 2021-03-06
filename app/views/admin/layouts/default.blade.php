<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	<meta name="description" content="Easy Customer">
	<meta name="author" content="Darshan Sheta">
	<link rel="icon" href="favicon.ico">

	<title>Starter Template for Bootstrap</title>

	<!-- Bootstrap core CSS -->
	<link href="{{asset('/')}}assets/bower/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="{{asset('/')}}assets/bower/font-awesome/css/font-awesome.min.css">

	<!-- Custom styles for this template -->
	<link href="{{asset('/')}}assets/basic/css/style.css" rel="stylesheet">

	<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
	<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
	<!--<script src="../../assets/js/ie-emulation-modes-warning.js"></script>-->

	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
</head>

<body>

	<!-- Fixed navbar -->
	    <nav class="navbar navbar-default navbar-fixed-top">
	      <div class="container">
	        <div class="navbar-header">
	          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
	            <span class="sr-only">Toggle navigation</span>
	            <span class="icon-bar"></span>
	            <span class="icon-bar"></span>
	            <span class="icon-bar"></span>
	          </button>
	          <a class="navbar-brand" href="#">Easy Customer Admin</a>
	        </div>
	        <div id="navbar" class="collapse navbar-collapse">
	          <ul class="nav navbar-nav">
	          @if (Auth::check())
	            <li ><a href="{{URL::to('admin/dashboard')}}" ui-sref="dashboard">Orders</a></li>
	            <li ><a href="{{URL::to('admin/products')}}" ui-sref="dashboard">Product</a></li>
	            <li ><a href="{{URL::to('admin/categories')}}" ui-sref="dashboard">Category</a></li>
	            <li ><a href="{{URL::to('admin/delivers')}}" ui-sref="dashboard">Deliver</a></li>
	            
	            {{-- <li ui-sref-active="active" ng-show="requireLogin()"><a href="#contact">Contact</a></li> --}}
	            <li class="dropdown"  ui-sref-active="open">
	              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Dropdown <span class="caret"></span></a>
	              <ul class="dropdown-menu" role="menu">
	                <li><a href="#">Action</a></li>
	                <li><a href="#">Another action</a></li>
	                <li><a href="#">Something else here</a></li>
	                <li class="divider"></li>
	                <li class="dropdown-header">Nav header</li>
	                <li><a href="#">Separated link</a></li>
	                <li><a href="#">One more separated link</a></li>
	              </ul>
	            </li>
	            @endif
	          </ul>
	          <ul class="nav navbar-nav navbar-right">
	            @if (Auth::check())
	            <li ><a href="#" ui-sref="logout">Logout</a></li>
	            @endif
	          </ul>
	        </div><!--/.nav-collapse -->
	      </div>
	    </nav>

	    <!-- Begin page content -->
	    <div class="container " id="main-container" ui-view>
	    	@if (Session::has('alert'))
	    	<div class="alert alert-{{Session::get('alert.type')}}">{{Session::get('alert.message')}}<a href="#" class="close" data-dismiss="alert">&times;</a></div>
	    	@endif
			{{-- <div class="page-header">
				<h2>Header</h2>
			</div> --}}
			@yield('content')
	    </div>

	    <footer class="footer">
	      <div class="container">
	        <p class="text-muted">Place sticky footer content here.</p>
	      </div>
	    </footer>

	<script src="{{asset('/')}}assets/bower/jquery/dist/jquery.min.js"></script>
	<script src="{{asset('/')}}assets/bower/bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="{{asset('/')}}assets/bower/blockUI/jquery.blockUI.js"></script>
	<script src="{{asset('/')}}assets/bower/underscore/underscore-min.js"></script>
	<script src="{{asset('/')}}assets/bower/jquery-validation/dist/jquery.validate.min.js"></script>
	<script type="text/javascript">
		$.validator.setDefaults({
		    highlight: function(element) {
		        $(element).closest('.form-group').addClass('has-error');
		    },
		    unhighlight: function(element) {
		        $(element).closest('.form-group').removeClass('has-error');
		    },
		    errorElement: 'span',
		    errorClass: 'help-block',
		    errorPlacement: function(error, element) {
		        if(element.parent('.input-group').length) {
		            error.insertAfter(element.parent());
		        } else {
		            error.insertAfter(element);
		        }
		    }
		});
	</script>
	@section('js')
	@show
	{{--<script src="{{asset('/')}}assets/basic/js/ie10-viewport-bug-workaround.js"></script>--}}

</body>
</html>
