(function(){

	var app = angular.module('easyCustomerApp',['ui.router','LocalStorageModule'])
	.constant('AppConstant', {
		apiRootPath:'http://localhost/easy-customer/public/api'
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
	app.controller('AuthController',['$scope','AuthenticationService',function($scope, AuthenticationService){
		$scope.init = {};
		$scope.newUser = {};

		$scope.registerUser = function (isValid) {
			if (isValid) {
				$('#register-user-form-panel').block(); 
				AuthenticationService.register($scope.newUser).success(function(response){
					$scope.registerUserForm.$setPristine();
					$scope.newUser = {};
					$('#register-user-form-panel').unblock();
				}).error(function(){
					$('#register-user-form-panel').unblock();
				});
			}
		};
	}]);
	// Factory ====================================================================================
	app.factory('Notification', [function(){
		return {
			show:function(response){
				$("#notfication-container").remove();
				var type = (response.success)? 'success' : 'danger' ;
				var message = response.message || response.error;
				var notficationContainer = $('<div id="notfication-container"></div>');
				if (typeof message == "string") {
					notficationContainer.append('<div class="alert alert-'+type+'">'+message+' <a href="#" class="close" data-dismiss="alert">&times;</a></div>');
				$('#main-container').prepend(notficationContainer);
				} else if(typeof message == "object") {
					for (var index in message ) {
						notficationContainer.append('<div class="alert alert-'+type+'">'+message[index]+' <a href="#" class="close" data-dismiss="alert">&times;</a></div>');
					}
					$("#main-container").prepend(notficationContainer);
				}
				$(window).scrollTop();
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

	app.factory("AuthenticationService", ['$http','SessionService','Notification','AppConstant',function($http, SessionService, Notification,AppConstant) {
			var apiRootPath = AppConstant.apiRootPath;
			var cacheSession   = function() {
				SessionService.set('authenticated', true);
			};

			var uncacheSession = function() {
				SessionService.unset('authenticated');
			};

			var loginError = function(response) {
				Notification.show(response);
			};

			/*var sanitizeCredentials = function(credentials) {
				return {
					username: $sanitize(credentials.username),
					password: $sanitize(credentials.password),
					csrf_token: CSRF_TOKEN
				};
			};*/

			return {
				register: function(newUser){
					return $http({
						method: 'POST',
						url:apiRootPath+'/auth/register',
						data:newUser
					}).success(function(response){
						Notification.show(response);
					}).error(function(response){
						Notification.show(response);
					});
				},
				login: function(credentials) {
					return $http({
						method: 'POST',
						url: apiRootPath+'auth/login',
						data: credentials
					}).success(function(response){
						
						Notification.show(response);
						SessionService.set('authenticated', true);
						//console.log(response);
					}).error(function(response){
						Notification.show(response);
						//console.log(response);
					});
				},
				logout: function() {
					var logout = $http.get(apiRootPath+"auth/logout");
					logout.success(uncacheSession);
					return logout;
				},
				isLoggedIn: function() {
					return SessionService.get('authenticated');
				}
			};
		}]);

}());