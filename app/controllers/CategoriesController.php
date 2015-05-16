<?php

class CategoriesController extends \BaseController {

	/**
	 * Display a listing of the resource.
	 * GET /categories
	 *
	 * @return Response
	 */
	public function index()
	{
		$categories = Category::get();
		return View::make('admin.categories.index')->with('categories',$categories);	
	}

	/**
	 * Show the form for creating a new resource.
	 * GET /categories/create
	 *
	 * @return Response
	 */
	public function create()
	{
		//
	}

	/**
	 * Store a newly created resource in storage.
	 * POST /categories
	 *
	 * @return Response
	 */
	public function store()
	{
		//
	}

	/**
	 * Display the specified resource.
	 * GET /categories/{id}
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
	 * GET /categories/{id}/edit
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function edit($id)
	{
		$category = Category::find($id);
		return View::make("admin.categories.edit")->with('category',$category);
	}

	/**
	 * Update the specified resource in storage.
	 * PUT /categories/{id}
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function update($id)
	{
		$response = array();
		$category = Category::find($id);

		if(empty($category))
			return array("success"=>false,"error"=>"category not found");
		
		$only = Input::only('level_discount','reference_discount', 'level');
		$edit_rules =  array(
				"level_discount"	=> "numeric|min:0",
				"reference_discount"	=> "numeric|min:0",
				"level"		=> 'required|integer'
				); 
		$v = Validator::make($only, $edit_rules);
		if(!$v->fails()){
			$category->level_discount = $only['level_discount'];
			$category->reference_discount = $only['reference_discount'];
			$category->level = $only['level'];

			$category->save();

			$response["success"] = true;
			$response["message"] = "category updated sucessfully";
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
	 * DELETE /categories/{id}
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		//
	}

}