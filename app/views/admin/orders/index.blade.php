@extends('admin.layouts.default')

@section('content')
<div class="row">
	<div class="panel panel-default">
		  <div class="panel-heading">
				<h3 class="panel-title">Orders</h3>
		  </div>
		  <div class="panel-body">
				<div class="table-responsive">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>No.</th>
								<th>Product</th>
								<th>Category</th>
								<th>User</th>
								<th>Total Amount</th>
								<th>Date</th>
							</tr>
						</thead>
						<tbody>
							@foreach ($orders as $order)
							<tr>
								<td>{{$order->id}}</td>
								<td>{{$order->product->name}}</td>
								<td>{{$order->category->name}}</td>
								<td>{{$order->user->name}}</td>
								<td>{{$order->total_amount}}</td>
								<td>{{date("d/m/Y",strtotime($order->created_at))}}</td>
							</tr>
							@endforeach
						</tbody>
					</table>
				</div>
		  </div>
	</div>
</div>
@stop