<?php

class OrderTree extends \Eloquent {
	protected $fillable = [];

	public function getLastParent(){
		return DB::table('order_trees')->max('parent_id');
	}

	public function getParent($id){
 		return OrderTree::find($id)->parent_id;
	}

	public function getChildCount($parent_id){
		return OrderTree::where('parent_id',$parent_id)->count();
	}
	
	public function addToTree($order_id,$product_id,$category_id){
		$last_parent_id = $this->getLastParent();
		$order_tree = new stdClass();
		if($last_parent_id === null){
			$order_tree  = new OrderTree();
			$order_tree->parent_id = 0;
			$order_tree->order_id = $order_id;
			$order_tree->user_id = Auth::id();
			$order_tree->product_id = $product_id;
			$order_tree->category_id = $category_id;
			$order_tree->save();
		}elseif ($last_parent_id === 0) {
			$order_tree  = new OrderTree();
			$order_tree->parent_id = 1;
			$order_tree->order_id = $order_id;
			$order_tree->user_id = Auth::id();
			$order_tree->product_id = $product_id;
			$order_tree->category_id = $category_id;
			$order_tree->save();
		}else{
			$child_count = $this->getChildCount($last_parent_id);
			if($child_count == 1){
				$order_tree  = new OrderTree();
				$order_tree->parent_id = $last_parent_id;
				$order_tree->order_id = $order_id;
				$order_tree->user_id = Auth::id();
				$order_tree->product_id = $product_id;
				$order_tree->category_id = $category_id;
				$order_tree->save();
			}elseif ($child_count == 2) {
				$order_tree  = new OrderTree();
				$order_tree->parent_id = $last_parent_id + 1;
				$order_tree->order_id = $order_id;
				$order_tree->user_id = Auth::id();
				$order_tree->product_id = $product_id;
				$order_tree->category_id = $category_id;
				$order_tree->save();
			}
		}
		return $order_tree->id;
	}	

}