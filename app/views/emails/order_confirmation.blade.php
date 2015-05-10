<!DOCTYPE html>
<html>
<head>
	<title>Order Confirmation</title>
</head>
<body>
<h3>Hello {{$order->user->name}},</h3>
<p>
Your order for <b>{{$order->product->name}}</b> has been placed <br>
find attached invoice for <b>{{$order->product->name}}</b> order.<br>
Order Date: {{date("d,M Y H:i",strtotime($order->created_at))}}<br>
<p>
<br>
Thank you,<br>
CrestDeal System

</body>
</html>