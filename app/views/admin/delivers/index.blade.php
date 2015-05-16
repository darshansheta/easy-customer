@extends('admin.layouts.default')

@section('content')
<div class="row">
	<div class="panel panel-default">
		  <div class="panel-heading">
				<h3 class="panel-title">Delivers</h3>
		  </div>
		  <div class="panel-body">
				<div class="table-responsive">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>No.</th>
								<th>Pincode</th>
								<th>Facility Type</th>
								<th>Phone</th>
								<th>Email</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							@foreach ($delivers as $deliver)
							<tr>
								<td>{{$deliver->id}}</td>
								<td>{{$deliver->pincode}}</td>
								<td>{{$deliver->facility}}</td>
								<td>{{$deliver->phone}}</td>
								<td>{{$deliver->email}}</td>
								<td>
									<a type="button" class="btn btn-default" href="{{URL::to('/admin/delivers/'.$deliver->id.'/edit')}}">Edit</a>
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