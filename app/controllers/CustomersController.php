<?php

class CustomersController extends \BaseController {

	/**
	 * Display a listing of the resource.
	 * GET /customers
	 *
	 * @return Response
	 */
	public function index()
	{
		//
	}

	/**
	 * Show the form for creating a new resource.
	 * GET /customers/create
	 *
	 * @return Response
	 */
	public function create()
	{
		//
	}

	/**
	 * Store a newly created resource in storage.
	 * POST /customers
	 *
	 * @return Response
	 */
	public function store()
	{
		//
	}

	/**
	 * Display the specified resource.
	 * GET /customers/{id}
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
	 * GET /customers/{id}/edit
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
	 * PUT /customers/{id}
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
	 * DELETE /customers/{id}
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		//
	}


	public function uploaddocument(){
		$response = array();
		if(Input::has('type') && Input::hasFile('file')){
			$type = Input::get('type');
			if(in_array($type,array('id_proof','address_proof'))){
				$extension = strtolower(Input::file('file')->getClientOriginalExtension());
				if(!in_array($extension, array('jpg','jpeg','png'))){
					$response['success'] = false;
					$response['message'] = 'Invalid file type';
					return Response::json($response,self::$errorStatusCode);
				}
				$user = User::find(Auth::id());
				$file = Input::file('file'); 
				$uploadDir = 'uploads/customers/';
				$destinationPath = public_path()."/".$uploadDir;
				$fileName = date('YmdHis')."_".rand(11111,99999).'.'.$extension;//Input::file('file')->getClientOriginalName();//
				Input::file('file')->move($destinationPath, $fileName);

				$customer_document = new CUstomerDocument();
				$customer_document->user_id = Auth::id();
				$customer_document->type = $type;
				$customer_document->file_name = $fileName;
				$customer_document->save();

				$response['success'] = true;
				$response['type'] = $type;
				$response['id'] = $customer_document->id;
				$response['message'] = "Document uploaded successfully";

				return $response;

			}else{
				$response['success'] = false;
				$response['error'] = "invalid doc type";
				return Response::json($response,self::$errorStatusCode);
			}
		}else{
			$response['success'] = false;
			$response['error'] = "params missing";
			return Response::json($response,self::$errorStatusCode);
		}
		return $response;
	}

}