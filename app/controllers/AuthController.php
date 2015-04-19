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
		$only = Input::only('name', 'email', 'password');

		if (User::validate($only) === true) {
			$user = new User();

			$user->name = $only['name'];
			$user->email = $only['email'];
			$user->password = Hash::make($only['password']);
			$user->save();

			$response['success'] = true;
			$response['message'] = "Registered sucessfully.";
			return Response::json($response,self::$errorStatusCode);
		} else {
			$v = User::validate($only);
			$response['success'] = false;
			$response['error'] = $v->messages()->toArray();
			return Response::json($response,self::$errorStatusCode);
		}
	}

}