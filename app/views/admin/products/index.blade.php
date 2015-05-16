@extends('admin.layouts.default')

@section('content')
<div class="row">
	<div class="panel panel-default">
		  <div class="panel-heading">
				<h3 class="panel-title">Products</h3>
		  </div>
		  <div class="panel-body">
				<div class="table-responsive">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>No.</th>
								<th>Product</th>
								<th>Category</th>
								<th>Price(Normal - Urgent)</th>
								<th>Phone</th>
								<th>Email</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							@foreach ($products as $product)
							<tr>
								<td>{{$product->id}}</td>
								<td>{{$product->name}}</td>
								<td>{{$product->category->name}}</td>
								<td>{{$product->normal_amount}} - {{$product->urgent_amount}}</td>
								<td>{{$product->phone}}</td>
								<td>{{$product->email}}</td>
								<td>
									<a type="button" class="btn btn-default" href="{{URL::to('/admin/products/'.$product->id.'/edit')}}">Edit</a>
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