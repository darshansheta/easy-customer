<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the Closure to execute when that URI is requested.
|
*/

Route::get('/', function()
{
	//$order = Order::with('product','user','category')->find(1);
	/*$pdf = PDF::loadView('emails.invoice', array("order"=>$order));
	$pdf->save('pdf/invoices/123abc.pdf');
	exit;*/
	/*Mail::send('email_templates.invoice', array("order"=>$order), function($message) {
	    $message->to('darshan.denz@gmail.com', 'Darshan Sheta')->subject('Welcome to the Laravel 4 Auth App!');
	    $message->attach("pdf/invoices/123abc.pdf");
	});*/
	return View::make('frontend');
});
//verification_code
Route::get('users/verify/{verification_code}',function($verification_code){
	//return $verification_code
	$user = User::where('verification_code',$verification_code)->first();
	if(empty($user)){
		return "Something missing";
	}
	$user->verfied = 1;
	$user->save();
	return "Your email address is verfied";
});
Route::get('/detect', function()
{
	echo "<pre>";
	print_r(Request::header('Connectiondf'));
	exit;
	echo "<br>Agent::device()-".Agent::device();;
	echo "<br>Agent::platform();>-".Agent::platform();;
	echo "<br>Agent::browser()-".Agent::browser();;
	$browser = Agent::browser();
$version = Agent::version($browser);
	echo "<br>-version".$version;
	echo "<br>-";
	$platform = Agent::platform();
$version = Agent::version($platform);
	echo "<br>version-".$version;
	exit;
});

Route::group(array('prefix' => 'api'), function(){
	//Route::resource('auth','AuthController');
	Route::post('auth/register','AuthController@register');
	Route::post('auth/login','AuthController@login');
	Route::post('auth/logout','AuthController@logout');

	Route::get('users/discounts','UsersController@discounts');
});

Route::group(array('prefix' => 'api', 'before' => 'auth.token'), function(){
	
	Route::get('users/discounts','UsersController@discounts');
	Route::post('/orders','OrdersController@create');

	Route::get('categories',function(){
		$response = array();
		$categories = Category::get()->toArray();

		$response['success'] = true;
		$response['categories'] = $categories;
		$response['user'] = Auth::user();
		//$response['message'] = "Logged In sucessfully.";
		return $response;
	});

	Route::get('products',function(){
		$response = array();
		$products = Product::get()->toArray();

		$response['success'] = true;
		$response['products'] = $products;
		$response['user'] = Auth::user();
		//$response['message'] = "Logged In sucessfully.";
		return $response;
	});
	
	Route::post('/upload-document','CustomersController@uploaddocument');
	Route::post('/upload-order-document','OrdersController@uploaddocument');
	
});