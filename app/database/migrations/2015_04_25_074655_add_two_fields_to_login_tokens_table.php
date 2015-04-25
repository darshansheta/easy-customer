<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class AddTwoFieldsToLoginTokensTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('login_tokens', function(Blueprint $table)
		{
			$table->string('os',100)->nullable();
			$table->string('browser',100)->nullable();
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('login_tokens', function(Blueprint $table)
		{
			$table->dropColumn('os');
			$table->dropColumn('browser');
		});
	}

}
