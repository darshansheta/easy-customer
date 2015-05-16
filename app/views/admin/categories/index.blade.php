@extends('admin.layouts.default')

@section('content')
<div class="row">
	<div class="panel panel-default">
		  <div class="panel-heading">
				<h3 class="panel-title">Categories</h3>
		  </div>
		  <div class="panel-body">
				<div class="table-responsive">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>No.</th>
								<th>Name</th>
								<th>Level</th>
								<th>Level Discount</th>
								<th>Reference Discount</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							@foreach ($categories as $category)
							<tr>
								<td>{{$category->id}}</td>
								<td>{{$category->name}}</td>
								<td>{{$category->level}}</td>
								<td>{{$category->level_discount}}</td>
								<td>{{$category->reference_discount}}</td>
								<td>
									<a type="button" class="btn btn-default" href="{{URL::to('/admin/categories/'.$category->id.'/edit')}}">Edit</a>
								</td>
							</tr>
							@endforeach
						</tbody>
					</table>
				</div>
		  </div>
	</div>
</div>
@stop