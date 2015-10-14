var app = angular.module('WingWatchApp',['ngRoute','routeStyles']);
app.config(['$routeProvider', function($routeProvider) {
	  $routeProvider.when('/login', {templateUrl: '_wing-watch-core/components/login-registro/login-registroView.html', controller:'login-registroCtrl', css: ['assets/css/login-registro.css','assets/css/registro.css']});
  	$routeProvider.otherwise({redirectTo: '/login'});
}]);
