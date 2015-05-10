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

				$only = Input::only('name', 'email','address','city','state','pincode','phone','dob','gender','pan');
				if (Customer::validate($only) === true) {
					$customer_id = (Input::has('customer_id')) ? Input::get('customer_id') : 0;
					if(!$customer_id){
						if(Input::has('id_proof') && Input::has('address_proof')){

						}else{
							$response['success'] = false;
							$response['error'] = "Document not found";
							return Response::json($response,self::$errorStatusCode);
						}
						$customer = new Customer();
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
						$customer->pan = $only['pan'];

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
					//do mail and smsm
					//file post requst to url
					//create pdf

				}elseif ($category_id == 2) {
					if(Input::has('coi') && Input::has('subscriber_page')){

					}else{
						$response['success'] = false;
						$response['error'] = "Document not found";
						return Response::json($response,self::$errorStatusCode);
					}

					$order = new Order();
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

					$id_proof_doc = OrderDocument::find(Input::get('coi'));
					$id_proof_doc->order_id = $order->id ;
					$id_proof_doc->save();

					$address_proof_doc = OrderDocument::find(Input::get('subscriber_page'));
					$address_proof_doc->order_id = $order->id ;
					$address_proof_doc->save();

				}elseif ($category_id == 3) {
					if(Input::has('coi')){

					}else{
						$response['success'] = false;
						$response['error'] = "Document not found";
						return Response::json($response,self::$errorStatusCode);
					}

					$order = new Order();
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

					$id_proof_doc = OrderDocument::find(Input::get('coi'));
					$id_proof_doc->order_id = $order->id ;
					$id_proof_doc->save();


				}elseif ($category_id == 4) {
					if(Input::has('coi')){

					}else{
						$response['success'] = false;
						$response['error'] = "Document not found";
						return Response::json($response,self::$errorStatusCode);
					}

					$order = new Order();
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

					$id_proof_doc = OrderDocument::find(Input::get('coi'));
					$id_proof_doc->order_id = $order->id ;
					$id_proof_doc->save();


				}


				//-------------------------------------------------------------------
				$ot = new OrderTree();
				$order_tree_id = $ot->addToTree($order->id,$product_id,$category_id);
				// $order_tree = OrderTree::find($order_tree_id);

				$ud = new UserDiscount();
				$ud->updateDiscount($order_tree_id,$category);

				//invoice to user----------------------------------
				$order_id = $order->id;
				$pdf = PDF::loadView('pdfs.invoice', array("order"=>$order));
				$invoice_file_name = "INVOICE-".date("YmdHis")."-".$order_id;
				$pdf->save('pdf/invoices/'.$invoice_file_name.'.pdf');

				$order->invoice_file_name = $invoice_file_name.".pdf";

				$order->save();

				Mail::send('emails.order_confirmation', array("order"=>$order), function($message)  use ($product,$invoice_file_name){
				    $message->to(Auth::user()->email, Auth::user()->name)->subject('Order Confirmation & Invoice - '.$product->name);
				    $message->attach("pdf/invoices/".$invoice_file_name.".pdf");
				});

				//update to delivery department----------------------------------
				$deliver = Deliver::where('pincode',Auth::user()->pincode)->first();
				if(empty($deliver)){
					$pincode_email = Setting::where('key','deliver_default_email')->first()->value;
				}else{
					$pincode_email = $deliver->email;
				}

				Mail::send('emails.deliver', array("order"=>$order), function($message)  use ($product,$pincode_email) {
				    $message->to($pincode_email, "Staff")->subject('New order placed for - '.$product->name);
				});
				
				//update to production department----------------------------------
				$production_email = $product->email;

				Mail::send('emails.create_new_product', array("order"=>$order), function($message) use ($product,$production_email)  {
				    $message->to($production_email, "Production Staff")->subject('Be ready with - '.$product->name);
				});


				$response['success'] = false;
				$response['product'] = $product->email;
				$response['order_id'] = $order->id;
				$response['order_tree_id'] = $order_tree_id;
				$response['user'] = Auth::user()->toArray();
				$response['message'] = "Order placed sucessfully";
				return Response::json($response,self::$errorStatusCode);
				 
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

	public function uploaddocument(){
		$response = array();
		if(Input::has('type') && Input::hasFile('file')){
			$type = Input::get('type');
			if(in_array($type,array('coi','subscriber_page','inc7'))){
				$extension = strtolower(Input::file('file')->getClientOriginalExtension());
				if(!in_array($extension, array('jpg','jpeg','png','pdf','doc','docx'))){
					$response['success'] = false;
					$response['message'] = 'Invalid file type';
					return Response::json($response,self::$errorStatusCode);
				}
				$user = User::find(Auth::id());
				$file = Input::file('file'); 
				$uploadDir = 'uploads/orders/';
				$destinationPath = public_path()."/".$uploadDir;
				$fileName = date('YmdHis')."_".rand(11111,99999).'.'.$extension;//Input::file('file')->getClientOriginalName();//
				Input::file('file')->move($destinationPath, $fileName);

				$order_document = new OrderDocument();
				$order_document->user_id = Auth::id();
				$order_document->type = $type;
				$order_document->file_name = $fileName;
				$order_document->save();

				$response['success'] = true;
				$response['type'] = $type;
				$response['id'] = $order_document->id;
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