<?php

class ProductsController extends \BaseController {

	/**
	 * Display a listing of the resource.
	 * GET /products
	 *
	 * @return Response
	 */
	public function index()
	{
		$products = Product::with('category')->get();
		return View::make("admin.products.index")->with('products',$products);
	}

	/**
	 * Show the form for creating a new resource.
	 * GET /products/create
	 *
	 * @return Response
	 */
	public function create()
	{
		//
	}

	/**
	 * Store a newly created resource in storage.
	 * POST /products
	 *
	 * @return Response
	 */
	public function store()
	{
		//
	}

	/**
	 * Display the specified resource.
	 * GET /products/{id}
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
	 * GET /products/{id}/edit
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function edit($id)
	{
		$product = Product::find($id);
		return View::make("admin.products.edit")->with('product',$product);
	}

	/**
	 * Update the specified resource in storage.
	 * PUT /products/{id}
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function update($id)
	{
		$response = array();
		$product = Product::find($id);

		if(empty($product))
			return array("success"=>false,"error"=>"Product not found");
		
		$only = Input::only('normal_amount','urgent_amount', 'email','phone');
		$edit_rules =  array(
				"normal_amount"	=> "numeric|min:0",
				"urgent_amount"	=> "numeric|min:0",
				"email"		=> 'required|email|max:200',
				"phone"	=> arraY('required','regex:[^\d{10}$]'),
				); 
		$v = Validator::make($only, $edit_rules);
		if(!$v->fails()){
			$product->normal_amount = $only['normal_amount'];
			$product->urgent_amount = $only['urgent_amount'];
			$product->email = $only['email'];
			$product->phone = $only['phone'];

			$product->save();

			$response["success"] = true;
			$response["message"] = "Product updated sucessfully";
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
	 * DELETE /products/{id}
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		//
	}

}