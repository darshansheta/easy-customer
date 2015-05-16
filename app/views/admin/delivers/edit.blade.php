@extends('admin.layouts.default')

@section('content')
<div class="row">
	<div class="panel panel-default" id="deliver-edit-form-panel">
		<div class="panel-heading">
			<h3 class="panel-title">Edit Delivers</h3>
		</div>
		<div class="panel-body">
			<form class="form-horizontal" method="post" id="deliver-edit-form" action="{{URL::to('admin/delivers/'.$deliver->id)}}" novalidate>
				<div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label">Zipcode</label>
					<div class="col-sm-10">
						<span class="form-control" disabled>{{$deliver->pincode}}</span>
						<input type="hidden" name="_method" value="put">
					</div>
				</div>
				<div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label">Facility Type</label>
					<div class="col-sm-10">
						<select name="facility" id="facility" class="form-control" required="required">
							<option value="a" <?php if($deliver->facility == 'a'){ echo "selected"; } ?> >A</option>
							<option value="b" <?php if($deliver->facility == 'b'){ echo "selected"; } ?> >B</option>
						</select>
					</div>
				</div>
				<div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label">Phone</label>
					<div class="col-sm-10">
						<input type="text" name="phone" id="phone" class="form-control" value="{{$deliver->phone}}" required="required" title="">
					</div>
				</div>
				<div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label">Email</label>
					<div class="col-sm-10">
						<input type="text" name="email" id="email" class="form-control" value="{{$deliver->email}}" required="required" title="">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-default">Update</button>
					</div>
				</div>
			</form>		  
		</div>
	</div>
</div>
@stop

@section('js')
<script type="text/javascript">
$(document).ready(function(){
	
	$("#deliver-edit-form").validate({
		rules:{
			"facility":{required:true},
			"phone":{required:true},
			"email":{required:true,email:true},
		},
		submitHandler:function(form){
			console.log(form);
			$("#deliver-edit-form-panel").block();
			$.ajax({
				url:"{{URL::to('admin/delivers/'.$deliver->id)}}",
				method:"post",
				data:$("#deliver-edit-form").serialize(),
				success:function(response){
					$("#deliver-edit-form-panel").unblock();
					if(response.success){
						window.location = "{{URL::to('admin/delivers')}}";
					}
				},
				error:function(response){
					$("#deliver-edit-form-panel").unblock();
				}
			});
			return false;
		}
	});
});
</script>
@stop