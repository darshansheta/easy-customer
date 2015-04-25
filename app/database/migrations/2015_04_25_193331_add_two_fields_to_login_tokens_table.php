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
			$table->string('os_version',20)->nullable()->after('os');;
			$table->string('browser_version',20)->nullable()->after('browser');
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
			$table->dropColumn('os_version');
			$table->dropColumn('browser_version');
		});
	}

}
