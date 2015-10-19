var app = angular.module('SupermercadoApp', ['ngRoute', 'routeStyles']);
app.config(['$routeProvider', function($routeProvider) {
    $routeProvider.when('/login', {
        templateUrl: '_core/components/login/loginView.html',
        controller: 'loginCtrl',
        css: ['assets/css/login.css']
    });
    $routeProvider.when('/home', {
        templateUrl: '_core/components/home/homeView.html',
        controller: 'homeCtrl',
        css: ['assets/css/login.css']
    });
    $routeProvider.when('/productos', {
        templateUrl: '_core/components/ver_productos/productosView.html',
        controller: 'productosCtrl'
    });
    $routeProvider.when('/nuevo', {
        templateUrl: '_core/components/nuevo/nuevoView.html',
        controller: 'nuevoCtrl'
    });
    $routeProvider.when('/actualizar', {
        templateUrl: '_core/components/actualizar/actualizarView.html',
        controller: 'actualizarCtrl'
    });
    $routeProvider.otherwise({
        redirectTo: '/login'
    });
}]);


