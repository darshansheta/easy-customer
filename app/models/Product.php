<?php

class Product extends \Eloquent {
	protected $fillable = [];
	public function category()
    {
        return $this->belongsTo('Category');
    }

    public static function validate($input)
	{
		$v = Validator::make($input, static::$rules);
		return $v->fails()
		? $v
		: true;

	
	}
}