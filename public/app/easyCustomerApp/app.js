(function(){

	var app = angular.module('easyCustomerApp',['ui.router','LocalStorageModule'])
	.constant('AppConstant', {
		apiRootPath:'http://localhost/easy-customer/public/'
	})
	.config(function (localStorageServiceProvider) {
		localStorageServiceProvider
			.setPrefix('easyCustomerApp')
		    .setStorageCookie(0, '/')
			.setStorageCookieDomain('')
    		.setStorageType('localStorage');
	})
	.config(['$stateProvider','$urlRouterProvider',function($stateProvider, $urlRouterProvider){

		var baseUrl = 'app/easyCustomerApp/views/';

		$urlRouterProvider.otherwise('/home');

		$stateProvider
			.state('home',{
				url:'/home',
				templateUrl:baseUrl+'home.html'
			})
			.state('register',{
				url:'/register',
				templateUrl:baseUrl+'register.html',
				controller: 'AuthController'
			})
			.state('login',{
				url:'/login',
				templateUrl:baseUrl+'login.html',
				controller: 'AuthController'
			})


	}]);
	
	// Controllers ================================================================================
	app.controller('AuthController',['$scope','Notification',function($scope, Notification){
		$scope.init = {};
		$scope.newUser = {};
	}]);
	// Factory ====================================================================================
	app.factory('Notification', [function(){
		return {
			show:function(response){
				var type = (response.success)? 'success' : 'danger' ;
				var message = response.message || response.error;
				$('#main-container').prepend('<div class="alert alert-'+type+'">'+message+' <a href="#" class="close" data-dismiss="alert">&times;</a></div>');
			}
		};
	}]);

	app.factory("SessionService",[ 'localStorageService', function(localStorageService) {
		return {
			get: function(key) {
				return localStorageService.get(key);
			},
			set: function(key, val) {
				return localStorageService.set(key, val);
			},
			unset: function(key) {
				return localStorageService.remove(key);
			}
		}
	}]);

}());