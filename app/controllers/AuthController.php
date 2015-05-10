<?php

class Authcontroller extends \BaseController {

	/**
	 * Display a listing of the resource.
	 * GET /authcontroller
	 *
	 * @return Response
	 */
	public function index()
	{
		//
	}

	/**
	 * Show the form for creating a new resource.
	 * GET /authcontroller/create
	 *
	 * @return Response
	 */
	public function create()
	{
		//
	}

	/**
	 * Store a newly created resource in storage.
	 * POST /authcontroller
	 *
	 * @return Response
	 */
	public function store()
	{
		//
	}

	/**
	 * Display the specified resource.
	 * GET /authcontroller/{id}
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{
		//
	}

	/**
	 * Show the form for editing the specified resource.
	 * GET /authcontroller/{id}/edit
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function edit($id)
	{
		//
	}

	/**
	 * Update the specified resource in storage.
	 * PUT /authcontroller/{id}
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function update($id)
	{
		//
	}

	/**
	 * Remove the specified resource from storage.
	 * DELETE /authcontroller/{id}
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		//
	}

	public function register()
	{
		$response = array();
		$only = Input::only('name', 'email', 'password','address','city','state','pincode','phone');

		if (User::validate($only) === true) {
			$user = new User();

			$verification_code = base64_encode($only['email']."YmdHis");

			$user->name = $only['name'];
			$user->email = $only['email'];
			$user->address = $only['address'];
			$user->city = strtolower($only['city']);
			$user->state = strtolower($only['state']);
			$user->pincode = $only['pincode'];
			$user->phone = $only['phone'];
			$user->password = Hash::make($only['password']);
			$user->verification_code = $verification_code;
			$user->save();
			Mail::send('emails.verify', array("verification_code"=>$verification_code), function($message) use ($only) {
			    $message->to($only['email'], $only['name'])->subject('CrestDeal Email Verification ');
			});
			$response['success'] = true;
			$response['message'] = "Registered sucessfully. We have sent you email for verifcation process. Please verify email address by clicking on link in email.";
			return $response;
		} else {
			$v = User::validate($only);
			$response['success'] = false;
			$response['error'] = $v->messages()->toArray();
			return Response::json($response,self::$errorStatusCode);
		}
	}

	public function login()
	{
		$response = array();
		$only = Input::only('email','password');

		$user = User::where('email',$only['email'])->first();
		if(empty($user)){
			$response['success'] = false;
			$response['error'] = 'Invalid Email.';
			return Response::json($response,self::$errorStatusCode);
		}
		if(!$user->verfied){
			$response['success'] = false;
			$response['error'] = 'Verfiy email address.';
			return Response::json($response,self::$errorStatusCode);
		}
		if(!$user->active){
			$response['success'] = false;
			$response['error'] = 'Account is disabled';
			return Response::json($response,self::$errorStatusCode);
		}

		if (Auth::attempt(array('email' => $only['email'], 'password' => $only['password'],'active' => 1,'verfied' => 1)))
		{
		    $token = md5(Auth::id().Auth::user()->email.Agent::platform().Agent::browser());
		    $login_token = LoginToken::where('user_id',Auth::id())->where('token',$token)->first();
		    if(empty($login_token)){
		    	$login_token = new LoginToken();
			    $login_token->user_id = Auth::id(); 
			    $login_token->token = $token;
			    $login_token->os = Agent::platform();
			    $login_token->os_version = Agent::version(Agent::platform());
			    $login_token->browser = Agent::browser();
			    $login_token->browser_version = Agent::version(Agent::browser());
				$login_token->save();
			}else{
				$login_token->touch();
			}
			Auth::logout();

			$response['success'] = true;
			$response['token'] = $token;
			$response['message'] = "Logged In sucessfully.";
			return $response;

		}else{
			$response['success'] = false;
			$response['error'] = 'Invalid credential.';
			return Response::json($response,self::$errorStatusCode);
		}
	}

	public function logout()
	{
		LoginToken::where('user_id',Auth::id())->where('token',Request::header('token'))->delete();
		$response['success'] = true;
		$response['error'] = 'Logged out';
		return Response::json($response,self::$notAuthorized);
	}

}