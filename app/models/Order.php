<?php

class Order extends \Eloquent {
	protected $fillable = [];

	public function product()
    {
        return $this->belongsTo('Product');
    }
	public function user()
    {
        return $this->belongsTo('User');
    }
	public function category()
    {
        return $this->belongsTo('Category');
    }
}