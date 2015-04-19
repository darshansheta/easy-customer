<?php

use Illuminate\Auth\UserTrait;
use Illuminate\Auth\UserInterface;
use Illuminate\Auth\Reminders\RemindableTrait;
use Illuminate\Auth\Reminders\RemindableInterface;

class User extends Eloquent implements UserInterface, RemindableInterface {

	use UserTrait, RemindableTrait;

	/**
	 * The database table used by the model.
	 *
	 * @var string
	 */
	protected $table = 'users';

	/**
	 * The attributes excluded from the model's JSON form.
	 *
	 * @var array
	 */
	protected $hidden = array('password', 'remember_token');

	public static $rules = array(
				"name"		=> "required|min:4|max:200",
				//"username"	=> "required|min:4|max:200",
				"email"		=> 'required|email|max:200|unique:users',
				"password"	=> 'required|min:4|max:200',
				);

	public static function validate($input)
	{
		$v = Validator::make($input, static::$rules);
		return $v->fails()
		? $v
		: true;

		}

}
