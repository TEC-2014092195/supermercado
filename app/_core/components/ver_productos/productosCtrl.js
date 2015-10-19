app.controller('productosCtrl', ['$scope', '$http', '$location', function($scope, $http, $location) {
    $scope.iniciar = function() {
        $http.get('_core/components/ver_productos/obtener_producto.php').success(function(data) {
            $scope.posts = data;
            console.log(data);
        });
        console.log("Ejecutado");
    };
    $scope.guardarDatos = function(obj) {
        sessionStorage.setItem('producto', JSON.stringify(obj));
        console.log(sessionStorage.getItem("producto"));
        $location.path('/actualizar');
        history.go(0);
    };
}]);
