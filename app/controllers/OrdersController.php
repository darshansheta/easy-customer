<?php

class OrdersController extends \BaseController {

	/**
	 * Display a listing of the resource.
	 * GET /orders
	 *
	 * @return Response
	 */
	public function index()
	{
		//
	}

	/**
	 * Show the form for creating a new resource.
	 * GET /orders/create
	 *
	 * @return Response
	 */
	public function create()
	{
		$response = array();
		$order_type = ( Input::has("order_type") ) ? Input::get("order_type") : "normal"; 
		$order_type = ( $order_type == "urgent" ) ? $order_type : "normal"; 
		if(Input::has('category_id')  && Input::has("product_id")){
			$category_id = Input::get('category_id');
			$product_id = Input::get('product_id');
			$category = Category::find($category_id);
			$product = Product::find($product_id);
			if(empty($category)){
				$response['success'] = false;
				$response['error'] = "Category not found";
				return Response::json($response,self::$errorStatusCode);
			}if(empty($product)){
				$response['success'] = false;
				$response['error'] = "product not found";
				return Response::json($response,self::$errorStatusCode);
			}
			$order = array();
			if($category_id == 1){

				$only = Input::only('name', 'email','address','city','state','pincode','phone','dob','gender');
				if (Customer::validate($only) === true) {
					$customer_id = (Input::has('customer_id')) ? Input::get('customer_id') : 0;
					if(!$customer_id){
						if(Input::has('id_proof') && Input::has('address_proof')){

						}else{
							$response['success'] = false;
							$response['error'] = "Document not found";
							return Response::json($response,self::$errorStatusCode);
						}
						$customer =  new Customer();
						$customer->user_id = Auth::id();
						$customer->name = $only['name'];
						$customer->email = $only['email'];
						$customer->dob = $only['dob'];
						$customer->address = $only['address'];
						$customer->city = $only['city'];
						$customer->state = $only['state'];
						$customer->pincode = $only['pincode'];
						$customer->gender = $only['gender'];
						$customer->phone = $only['phone'];

						$customer->save();

						$customer_id = $customer->id;

						$id_proof_doc = CustomerDocument::find(Input::get('id_proof'));
						$id_proof_doc->customer_id = $customer_id ;
						$id_proof_doc->save();

						$address_proof_doc = CustomerDocument::find(Input::get('address_proof'));
						$address_proof_doc->customer_id = $customer_id ;
						$address_proof_doc->save();
						}
					} else {
						$v = Customer::validate($only);
						$response['success'] = false;
						$response['error'] = $v->messages()->toArray();
						return Response::json($response,self::$errorStatusCode);
					}

					$order = new Order();
					$order->customer_id = $customer_id;
					$order->user_id = Auth::id();
					$order->category_id = $category_id;
					$order->product_id = $product_id;
					if($order_type == "normal"){
						$order->product_amount = $product->normal_amount;
						$order->total_amount = $product->normal_amount;
					}else{
						$order->product_amount = $product->urgent_amount;
						$order->total_amount = $product->urgent_amount;
					}
					$order->save();
					$response['success'] = true;
					$response['message'] = "Order placed sucessfully";

				}elseif ($category_id == 2) {
					# code...
				} 
		}else{
			$response['success'] = false;
			$response['error'] = "Parameter missing !!";
			return Response::json($response,self::$errorStatusCode);
		}

		// if(Input::hasFile('id_proof')){
		// 	$file = array('id_proof' => Input::file('id_proof'));
		// 	$response['file'] =$file;
		// }
		// $response['_file'] = $_FILES;
		// $response['get'] = Input::get();
		return $response; 
	}

	/**
	 * Store a newly created resource in storage.
	 * POST /orders
	 *
	 * @return Response
	 */
	public function store()
	{
		//
	}

	/**
	 * Display the specified resource.
	 * GET /orders/{id}
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
	 * GET /orders/{id}/edit
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
	 * PUT /orders/{id}
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
	 * DELETE /orders/{id}
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		//
	}

}