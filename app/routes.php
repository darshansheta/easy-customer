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

Route::get('/dsc', function()
{
	/*$client = new \GuzzleHttp\Client();
	//$client->setDefaultOption('verify', 'C:\Program Files (x86)\Git\bin\curl-ca-bundle.crt');
	$client->setDefaultOption('verify', false);
	$otldata = '{"osdetails":"OS = Windows 7/Windows Server 2008; OS Platform = 64 Bit; Browser = Chrome 42.0.2311.135; Browser Platform = 32 Bit;","policyname":"SafeScrypt subCA for RCAI Class 2 2014","classname":"RCAI Class 2 Individual 1 Year Signing 2014","regno":"","challengephrase":"cXdlcjEyMzQh","PANNumber":"2342423423","Comments":"","keytype":1,"dndetails":{"2.5.4.3":"Darshan Sheta","2.5.4.5":"aa35abea670358d869c8e355191a7c67f14303865d3eaef5bfdf0a7a3e19af50","2.5.4.8":"Maharashtra","2.5.4.17":"395004","2.5.4.10":"Personal","2.5.4.6":"IN"}}';
//echo "<pre>";
$otldata_arr = json_decode($otldata,true);

	//$client = new \Guzzle\Service\Client();
	$response = $client->post('https://dsc.safescrypt.com/DevIT/7010.html', [
	    'body' => [
	        'otldata' => $otldata_arr,
	        'sanvalue' => 'das@mailinator.com',
	        'csrtype' => '2',
	        'csrfile' => '',
	        'E-Mail id' => 'das@mailinator.com',
	    ]
	]);
	echo $response->getHeaders();
	echo $response->getBody();
	//=======================
	$request = $client->createRequest('POST', 'http://httpbin.org/post');
	$postBody = $request->getBody();

	// $postBody is an instance of GuzzleHttp\Post\PostBodyInterface
	$postBody->setField('foo', 'bar');
	echo $postBody->getField('foo');
	// 'bar'

	echo json_encode($postBody->getFields());
	// {"foo": "bar"}

	// Send the POST request
	$response = $client->send($request);
	//=======================
	//return View::make('frontend');*/
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

Route::get("/admin/login",function(){
	if(Auth::check()){
		return Redirect::to('/admin/dashboard');
	}
	return View::make("admin.auth.login");
});
Route::post("/admin/dologin",function(){
	$response = array();
	$only = Input::only('email','password');
	if (Auth::attempt(array('email' => $only['email'], 'password' => $only['password'],'id'=>1),true))
	{
	    return Redirect::to('admin/dashboard');
	}else{
		Session::flash('alert', array("type"=>"success","message"=>"Hello"));
		return Redirect::to('/admin/login');
	}
});

Route::group(array('prefix' => 'admin', 'before' => 'auth.admin'), function(){
	
	Route::get("/",'OrdersController@index');
	Route::get("/dashboard",'OrdersController@index');

	Route::resource('orders', 'OrdersController');
	Route::resource('products', 'ProductsController');
	Route::resource('categories', 'CategoriesController');
	Route::resource('delivers', 'DeliversController');
	
});