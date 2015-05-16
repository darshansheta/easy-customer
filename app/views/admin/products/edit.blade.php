@extends('admin.layouts.default')

@section('content')
<div class="row">
	<div class="panel panel-default" id="product-edit-form-panel">
		<div class="panel-heading">
			<h3 class="panel-title">Edit Products</h3>
		</div>
		<div class="panel-body">
			<form class="form-horizontal" method="post" id="product-edit-form" action="{{URL::to('admin/products/'.$product->id)}}" novalidate>
				<div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label">Name</label>
					<div class="col-sm-10">
						<span class="form-control" disabled>{{$product->name}}</span>
						<input type="hidden" name="_method" value="put">
					</div>
				</div>
				<div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label">Normal Price</label>
					<div class="col-sm-10">
						<input type="text" name="normal_amount" id="normal_amount" class="form-control" value="{{$product->normal_amount}}" required="required" title="">
					</div>
				</div>
				<div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label">Urgent Price</label>
					<div class="col-sm-10">
						<input type="text" name="urgent_amount" id="urgent_amount" class="form-control" value="{{$product->urgent_amount}}" required="required" title="">
					</div>
				</div>
				<div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label">Phone</label>
					<div class="col-sm-10">
						<input type="text" name="phone" id="phone" class="form-control" value="{{$product->phone}}" required="required" title="">
					</div>
				</div>
				<div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label">Email</label>
					<div class="col-sm-10">
						<input type="text" name="email" id="email" class="form-control" value="{{$product->email}}" required="required" title="">
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
	
	$("#product-edit-form").validate({
		rules:{
			"normal_amount":{required:true,number:true,min:0},
			"urgent_amount":{required:true,number:true,min:0},
			"phone":{required:true},
			"email":{required:true,email:true},
		},
		submitHandler:function(form){
			console.log(form);
			$("#product-edit-form-panel").block();
			$.ajax({
				url:"{{URL::to('admin/products/'.$product->id)}}",
				method:"post",
				data:$("#product-edit-form").serialize(),
				success:function(response){
					$("#product-edit-form-panel").unblock();
					if(response.success){
						window.location = "{{URL::to('admin/products')}}";
					}
				},
				error:function(response){
					$("#product-edit-form-panel").unblock();
				}
			});
			return false;
		}
	});
});
</script>
@stop