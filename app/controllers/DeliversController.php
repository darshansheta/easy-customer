<?php

class DeliversController extends \BaseController {

	/**
	 * Display a listing of the resource.
	 * GET /delivers
	 *
	 * @return Response
	 */
	public function index()
	{
		$delivers = Deliver::get();
		return View::make('admin.delivers.index')->with('delivers',$delivers);	
	}

	/**
	 * Show the form for creating a new resource.
	 * GET /delivers/create
	 *
	 * @return Response
	 */
	public function create()
	{
		//
	}

	/**
	 * Store a newly created resource in storage.
	 * POST /delivers
	 *
	 * @return Response
	 */
	public function store()
	{
		//
	}

	/**
	 * Display the specified resource.
	 * GET /delivers/{id}
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
	 * GET /delivers/{id}/edit
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function edit($id)
	{
		$deliver = Deliver::find($id);
		return View::make("admin.delivers.edit")->with('deliver',$deliver);
	}

	/**
	 * Update the specified resource in storage.
	 * PUT /delivers/{id}
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function update($id)
	{
		$response = array();
		$deliver = Deliver::find($id);

		if(empty($deliver))
			return array("success"=>false,"error"=>"deliver not found");
		
		$only = Input::only('facility', 'email','phone');
		$edit_rules =  array(
				"facility"	=> "required",
				"email"		=> 'required|email|max:200',
				"phone"	=> arraY('required','regex:[^\d{10}$]'),
				); 
		$v = Validator::make($only, $edit_rules);
		if(!$v->fails()){
			$deliver->facility = $only['facility'];
			$deliver->email = $only['email'];
			$deliver->phone = $only['phone'];

			$deliver->save();

			$response["success"] = true;
			$response["message"] = "deliver updated sucessfully";
			return $response;

		}else{
			$messages = $v->messages();
			$response["success"] = false;
			$response["error"] = $messages;
			return $response;
		}
	}

	/**
	 * Remove the specified resource from storage.
	 * DELETE /delivers/{id}
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		//
	}

}