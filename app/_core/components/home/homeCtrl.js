app.controller('homeCtrl', function($scope, $http, $location) {
    $scope.verProductos = function() {
        $location.path('productos');
        history.go(0);
    };
    $scope.nuevoProducto = function() {
        $location.path('nuevo');
        history.go(0);
    };

});
