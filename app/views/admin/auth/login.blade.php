@extends('admin.layouts.default')

@section('content')
<div class="row">
	<div class="col-sm-6 col-sm-offset-3">
		<div class="panel panel-default" id="login-user-form-panel">
			  <div class="panel-heading">
					<h3 class="panel-title">Admin Login Here</h3>
			  </div>
			  <div class="panel-body">
					<form class="form-horizontal" action="{{URL::to('/admin/dologin')}}" method="post" role="form" name="loginUserForm" id="login-user-form">
							<div class="form-group" ng-class="">
								<label for="" class="col-sm-2 control-label">Email</label>
								<div class="col-sm-10">
									<input type="email" required class="form-control" name="email"  id="" placeholder="Email">
								</div>
							</div>
							<div class="form-group">
								<label for="" class="col-sm-2 control-label">Password</label>
								<div class="col-sm-10">
									<input type="password" name="password" class="form-control" id="password" placeholder="Password">
								</div>
							</div>
					
							<div class="form-group">
								<div class="col-sm-10 col-sm-offset-2">
									<button type="submit" class="btn btn-primary">Submit</button>
								</div>
							</div>
					</form>
			  </div>
		</div>
	</div>
</div>
@stop