<?php

class Customer extends \Eloquent {
	protected $fillable = [];
	public static $rules = array(
				"name"		=> "required|min:4|max:200",
				//"username"	=> "required|min:4|max:200",
				"email"		=> 'required|email|max:200',
				"address"		=> 'required',
				"city"		=> 'required|max:200',
				"state"		=> 'required|max:200',
				"pincode"		=> arraY('required','regex:[^\d{6}$]'),
				"phone"	=> arraY('required','regex:[^\d{10}$]'),
				"dob"	=> "required",
				"gender"	=> "required",
				"pan"	=> "required",
				);

	public static function validate($input)
	{
		$v = Validator::make($input, static::$rules);
		return $v->fails()
		? $v
		: true;

	
	}

	public function getLastParent(){
		return DB::table('orders')->max('id');
	}

	public function getParent($id){
 		return 1;
	}
}