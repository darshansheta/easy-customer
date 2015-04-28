<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateProductTreesTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('product_trees', function(Blueprint $table)
		{
			$table->increments('id');
			$table->integer('parent_id');
			$table->integer('user_id');
			$table->integer('product_id');
			$table->integer('category_id');
			$table->integer('left_child_id')->default(0);
			$table->integer('right_child_id')->default(0);
			$table->timestamps();
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('product_trees');
	}

}
