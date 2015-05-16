@extends('admin.layouts.default')

@section('content')
<div class="row">
	<div class="panel panel-default" id="category-edit-form-panel">
		<div class="panel-heading">
			<h3 class="panel-title">Edit Category</h3>
		</div>
		<div class="panel-body">
			<form class="form-horizontal" method="post" id="category-edit-form" action="{{URL::to('admin/categories/'.$category->id)}}" novalidate>
				<div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label">Name</label>
					<div class="col-sm-10">
						<span class="form-control" disabled>{{$category->name}}</span>
						<input type="hidden" name="_method" value="put">
					</div>
				</div>
				<div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label">Level Discount</label>
					<div class="col-sm-10">
						<input type="text" name="level_discount" id="level_discount" class="form-control" value="{{$category->level_discount}}" required="required" title="">
					</div>
				</div>
				<div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label">Urgent Price</label>
					<div class="col-sm-10">
						<input type="text" name="reference_discount" id="reference_discount" class="form-control" value="{{$category->reference_discount}}" required="required" title="">
					</div>
				</div>
				<div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label">Level</label>
					<div class="col-sm-10">
						<select name="level" id="level" class="form-control" required="required">
							<?php foreach (range(1,20) as $value): ?>
								<option value="{{$value}}" <?php if($value==$category->level){ echo "selected"; } ?>  >{{$value}}</option>
							<?php endforeach ?>
						</select>
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
	
	$("#category-edit-form").validate({
		rules:{
			"level_discount":{required:true,number:true,min:0},
			"reference_discount":{required:true,number:true,min:0},
			"level":{required:true,number:true},
		},
		submitHandler:function(form){
			console.log(form);
			$("#category-edit-form-panel").block();
			$.ajax({
				url:"{{URL::to('admin/categories/'.$category->id)}}",
				method:"post",
				data:$("#category-edit-form").serialize(),
				success:function(response){
					$("#category-edit-form-panel").unblock();
					if(response.success){
						window.location = "{{URL::to('admin/categories')}}";
					}
				},
				error:function(response){
					$("#category-edit-form-panel").unblock();
				}
			});
			return false;
		}
	});
});
</script>
@stop