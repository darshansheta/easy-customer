(function(){

	var app = angular.module('easyCustomerApp',['ui.router','LocalStorageModule','ngAnimate'])
	.constant('AppConstant', {
		apiRootPath:'http://localhost/easy-customer/public/api'
	})
	.config(['$httpProvider', function($httpProvider) {
		//$httpProvider.defaults.useXDomain = true;
		//delete $httpProvider.defaults.headers.common['X-Requested-With'];
		/*var logsOutUserOn401 = function($location, $q, SessionService, Notification) {
			var success = function(response) {
				return response;
			};

			var error = function(response) {
				if(response.status === 401) {
					SessionService.unset('authenticated');
					$location.path('/login');
					
					//To show errot using template notification plugin 
					setTimeout(function(){
						Notification.show(response.data);
						//console.log(response)
						//Metronic.initAjax();
					},500);
					
				}
				return $q.reject(response);
			};

			return function(promise) {
				return promise.then(success, error);
			};
		};

		$httpProvider.responseInterceptors.push(logsOutUserOn401);*/

		$httpProvider.interceptors.push( function($q, SessionService,Notification,$location) {
		            return {
		                'request': function (config) {
		                    config.headers = config.headers || {};
		                    var token = SessionService.get("token");
		                    token = token || "";
		                    config.headers.token = token;
		                    
		                    return config;
		                },
		                'responseError': function(response) {
		                	SessionService.unset('authenticated');
		                	SessionService.unset('token');
		                    console.log('status:'+response.status)
		                    if(response.status === 401 || response.status === 403) {
		                        $location.path('/login');
		                    }
		                    setTimeout(function(){
		                    	Notification.show(response.data);
		                    },500);
		                    return $q.reject(response);
		                }
		            };
		        });
	}])
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
				templateUrl:baseUrl+'home.html',
				data: {
				       requireLogin: false
				     }
			})
			.state('dashboard',{
				url:'/dashboard',
				templateUrl:baseUrl+'dashboard.html',
				controller: 'dashBoardController',
				data: {
				       requireLogin: true
				     }
			})
			.state('register',{
				url:'/register',
				templateUrl:baseUrl+'register.html',
				controller: 'AuthController',
				data: {
				       requireLogin: false
				     }
			})
			.state('login',{
				url:'/login',
				templateUrl:baseUrl+'login.html',
				controller: 'AuthController',
				data: {
				       requireLogin: false
				     }
			})
			.state('logout',{
				url:'/logout',
				templateUrl:baseUrl+'login.html',
				controller: 'AuthController',
				data: {
				       requireLogin: false
				     }
			})


	}]);
	app.run(function ($rootScope, $state, SessionService) {

	  $rootScope.$on('$stateChangeStart', function (event, toState, toParams) {
	    var requireLogin = toState.data.requireLogin;
	    var  token = SessionService.get('token');
	    if (requireLogin && (token == '' || token == null)) {
	      event.preventDefault();

	       return $state.go('login');
	    }
	  });
	  var token = SessionService.get('token');
	   $rootScope.requireLogin = function(){
	   	 var  token = SessionService.get('token');
	   	 return !(token == '' || token == null);
	   };
	});
	// Controllers ================================================================================
	app.controller('AuthController',['$scope','AuthenticationService','$state',function($scope, AuthenticationService,$state){
		$scope.init = {};
		$scope.newUser = {};
		$scope.loginUser = {};
		if($state.current.name == 'logout'){
			AuthenticationService.logout();
			$state.go('login');
		}
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
		$scope.doLogin = function (isValid) {
			if (isValid) {
				$('#login-user-form-panel').block(); 
				AuthenticationService.login($scope.loginUser).success(function(response){
					$scope.loginUserForm.$setPristine();
					$scope.loginUser = {};
					$('#login-user-form-panel').unblock();
				}).error(function(){
					$('#login-user-form-panel').unblock();
				});
			}
		};
	}]);
	app.controller('dashBoardController',['$scope',function($scope){

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
				if(key=="token"){
					return localStorageService.cookie.get(key);
				}
				return localStorageService.get(key);
			},
			set: function(key, val) {
				if(key=="token"){
					localStorageService.cookie.set(key, val);
				}
				return localStorageService.set(key, val);
			},
			unset: function(key) {
				if(key=="token"){
					localStorageService.cookie.remove(key);
				}
				return localStorageService.remove(key);
			}
		}
	}]);

	app.factory("AuthenticationService", ['$http','SessionService','Notification','AppConstant','$state',function($http, SessionService, Notification,AppConstant,$state) {
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
						url: apiRootPath+'/auth/login',
						data: credentials
					}).success(function(response){
						SessionService.set('token',response.token)
						Notification.show(response);
						$state.go('dashboard');
						SessionService.set('authenticated', true);
						//console.log(response);
					}).error(function(response){
						Notification.show(response);
						//console.log(response);
					});
				},
				logout: function() {
					//var logout = $http.get(apiRootPath+"auth/logout");
					//logout.success(uncacheSession);
					//return logout;
					SessionService.unset('token');
					SessionService.unset('authenticated');
				},
				isLoggedIn: function() {
					return SessionService.get('authenticated');
				}
			};
		}]);

}());