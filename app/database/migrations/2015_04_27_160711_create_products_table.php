<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateProductsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('products', function(Blueprint $table)
		{
			$table->increments('id');
			$table->string('name',200);
			$table->string('alias',200)->nullable();
			$table->integer('category_id')->default(0);
			$table->decimal('normal_amount',10,2);
			$table->decimal('urgent_amount',10,2);
			$table->decimal('reference_discount',10,2);
			$table->decimal('level_discount',10,2);
			$table->integer('level');
			$table->boolean('auto_approve')->default(true);
			$table->text('pincode_a_facility');
			$table->text('pincode_b_facility');
			$table->text('pincode_general_facility');
			$table->string('phone',30);
			$table->string('email',200);
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
		Schema::drop('products');
	}

}
