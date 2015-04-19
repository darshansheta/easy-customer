<?php

class BaseController extends Controller {

	public static $errorStatusCode	= 400 ; 
	public static $notAuthorized	= 401 ; 
	public static $notFoundCode		= 404 ;
	/**
	 * Setup the layout used by the controller.
	 *
	 * @return void
	 */
	protected function setupLayout()
	{
		if ( ! is_null($this->layout))
		{
			$this->layout = View::make($this->layout);
		}
	}

}
