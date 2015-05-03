(function(){

	var app = angular.module('easyCustomerApp',['ui.router','LocalStorageModule','ngAnimate','ngFileUpload'])
	.constant('AppConstant', {
		apiRootPath:'http://localhost/easy-customer/public/api/'
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
		                	
		                    console.log('status:'+response.status)
		                    if(response.status === 401 || response.status === 403) {
		                    	SessionService.unset('authenticated');
		                    	SessionService.unset('token');
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

		$urlRouterProvider.otherwise('/dashboard');

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
			.state('products',{
				url:'/products',
				templateUrl:baseUrl+'products.html',
				controller: 'productsController',
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
	app.controller('dashBoardController',['$scope','Discounts',function($scope,Discounts){
		$scope.UserDiscounts = [];
		Discounts.get().success(function(response){
			$scope.UserDiscounts = response.discounts;
		});

	}]);
	app.controller('productsController',['$scope','Categories','Products','Upload','AppConstant','Orders',function($scope,Categories,Products,Upload,AppConstant,Orders){
		$scope.categories = [];
		$scope.products = [];
		$scope.productOptions = [];
		$scope.category_id = "";
		$scope.product_id = "";
		$scope.order_type = "";
		$scope.selectedProduct = {};
		$scope.newCustomerDetail = {};
		$scope.id_proof = {};
		$scope.log = {};
		
		Categories.get().success(function(response){
			$scope.categories = response.categories;
			//set $scope.category_id when categories load
			//$scope.category_id = $scope.categories[0].id;
		});
		Products.get().success(function(response){
			$scope.products = response.products;
			//set $scope.category_id when categories load
			//$scope.category_id = $scope.categories[0].id;
		});
		/*$scope.$watch('id_proof', function () {
		        $scope.uploadDocument('id_proof');
		    });*/
		$scope.loadProductOptions = function(){
			if($scope.category_id){
				$scope.productOptions = [];
				$scope.product_id = "";
				for(var index in $scope.products){
					if($scope.products[index].category_id == $scope.category_id){
						$scope.productOptions.push($scope.products[index]); 
						
					}
				}
				$scope.product_id = angular.copy($scope.productOptions[0].id);
				$scope.displayProductForm();
			}
		};
		$scope.displayProductForm = function(){
			$scope.selectedProduct = _.findWhere($scope.products,{'id':$scope.product_id});
		}

		$scope.orderProductCat1 = function(isValid){
			if(isValid){
				if(!$scope.newCustomerDetail.id_proof || !$scope.newCustomerDetail.address_proof){
					alert("Please upload document");
					return false;
				}
				$('#order-product-cat1-form-panel').block();
				$scope.newCustomerDetail.category_id = angular.copy($scope.category_id);
				$scope.newCustomerDetail.product_id = angular.copy($scope.product_id);
				$scope.newCustomerDetail.order_type = angular.copy($scope.order_type);
				Orders.create($scope.newCustomerDetail).success(function(response){
					$scope.orderProductCat1Form.$setPristine();
					$scope.newCustomerDetail = {};
					$scope.newCustomerDetail.gender = "male";
					$scope.id_proof = {};
					$scope.address_proof = {};
					$("[ng-model='id_proof']").val("");
					$("[ng-model='address_proof']").val("");
					$('#order-product-cat1-form-panel').unblock();
					$(document).scrollTop(0);
				}).error(function(response){
					$('#order-product-cat1-form-panel').unblock();
					$(document).scrollTop(0);
				});
			}
		}
		$scope.uploadDocument = function(file,type){
			type = (type == 'id_proof')? 'id_proof' : 'address_proof' ;
			$('#order-product-cat1-form-panel').block();
			Upload.upload({
				url:AppConstant.apiRootPath+"upload-document",
				fields:{'type':type},
				file:file
			 })/*.progress(function (evt) {
                var progressPercentage = parseInt(100.0 * evt.loaded / evt.total);
                 $scope.log = 'progress: ' + progressPercentage + '% ' +
                            evt.config.file.name + '\n' + $scope.log;
             })*/.success(function (response, status, headers, config) {
                //$scope.log = 'file ' + config.file.name + 'uploaded. Response: ' + JSON.stringify(data) + '\n' + $scope.log;
                //$scope.$apply();
                console.log(response);
                if(response.type == "id_proof"){
					$scope.newCustomerDetail.id_proof = response.id;
                }if(response.type == "address_proof"){
					$scope.newCustomerDetail.address_proof = response.id;
                }
                $('#order-product-cat1-form-panel').unblock();
            }).error(function(response){
            	console.log(response);
            	$('#order-product-cat1-form-panel').unblock();
            });
             ;
		}

	}]);
	// Factory =====================================================================================================================
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
						url: apiRootPath+'auth/login',
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
		
		app.factory('Discounts', ['$http','Notification','AppConstant', function($http,Notification,AppConstant){
			var apiRootPath = AppConstant.apiRootPath;
			return {
				get:function(){
					return $http.get(apiRootPath+'users/discounts').success(function(response){
						return response;
					});
				}
			};
		}]);
		app.factory('Categories', ['$http','Notification','AppConstant', function($http,Notification,AppConstant){
			var apiRootPath = AppConstant.apiRootPath;
			return {
				get:function(){
					return $http.get(apiRootPath+'categories').success(function(response){
						return response;
					});
				}
			};
		}]);
		app.factory('Products', ['$http','Notification','AppConstant', function($http,Notification,AppConstant){
			var apiRootPath = AppConstant.apiRootPath;
			return {
				get:function(){
					return $http.get(apiRootPath+'products').success(function(response){
						return response;
					});
				}
			};
		}]);
		app.factory('Orders', ['$http','Notification','AppConstant', function($http,Notification,AppConstant){
			var apiRootPath = AppConstant.apiRootPath;
			return {
				get:function(){
					return $http.get(apiRootPath+'orders').success(function(response){
						return response;
					});
				},
				create:function(data){
					return $http({
						method: 'POST',
						url: apiRootPath+'orders',
						data: data
					}).success(function(response){
						Notification.show(response);
						//console.log(response);
					}).error(function(response){
						Notification.show(response);
						//console.log(response);
					});
				},
			};
		}]);

		//Directive===========================================================================================================
		var INTEGER_REGEXP = /^\-?\d+$/;
		var DATE_REGEXP = /^(0?[1-9]|[12][0-9]|3[01])[\/\-](0?[1-9]|1[012])[\/\-]\d{4}$/;
		app.directive('validate.date', function() {
		  return {
		    require: 'ngModel',
		    link: function(scope, elm, attrs, ctrl) {
		      ctrl.$validators.integer = function(modelValue, viewValue) {
		        if (ctrl.$isEmpty(modelValue)) {
		          // consider empty models to be valid
		          return true;
		        }

		        if (DATE_REGEXP.test(viewValue)) {
		          // it is valid
		          return true;
		        }

		        // it is invalid
		        return false;
		      };
		    }
		  };
		});


}());