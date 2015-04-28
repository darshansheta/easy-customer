<?php

class UserDiscount extends \Eloquent {
	protected $fillable = [];

	public function user()
    {
        return $this->belongsTo('User');
    }

	public function category()
    {
        return $this->belongsTo('Category');
    }

}