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

    public function updateDiscount($order_tree_id,$category,$level = 0)
    {
    	if($category->level != $level){
			$level =  $level + 1;
			$order_tree = OrderTree::find($order_tree_id);
			$parent_id = $order_tree->parent_id;
			$parent_order_tree = OrderTree::find($parent_id);
			if( !empty($parent_order_tree) && $parent_order_tree->category_id == $category->id){
				UserDiscount::where('user_id',$parent_order_tree->user_id)->where('category_id',$category->id)->increment('total_discount',$category->level_discount);
			}
			if( !empty($parent_order_tree)){
				$ud = new UserDiscount();
				if($parent_order_tree->parent_id != 0){
					$ud->updateDiscount($parent_order_tree->id,$category,$level);
				}
			}

    	}
    }

}