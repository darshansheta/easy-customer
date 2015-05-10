<!DOCTYPE html>
<html>
<head>
	<title>New Order Placed </title>
</head>
<body>
<h3>Hello ,</h3>
<p>
Need to deliver packet.<br><br>
product: {{$order->product->name}}
<br>
<p>

Address : {{$order->user->address}},<br>
City : {{$order->user->city}},<br>
State : {{$order->user->state}},<br>
Pincode : {{$order->user->pincode}},<br>
phone : {{$order->user->phone}},<br>
</p>
<br>
Thank you,<br>
CrestDeal System

</body>
</html>