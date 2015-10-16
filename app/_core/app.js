var app = angular.module('SupermercadoApp', ['ngRoute', 'routeStyles','flow']);
app.config(['$routeProvider', function($routeProvider) {
    $routeProvider.when('/login', {
        templateUrl: '_core/components/login/loginView.html',
        controller: 'loginCtrl',
        css: ['assets/css/login.css']
    });
    $routeProvider.otherwise({
        redirectTo: '/login'
    });
}]);


