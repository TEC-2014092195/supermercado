var app = angular.module("ver_producto",[]);
app.controller('verproductoCtrl', ['$scope','$http', '$location', function($scope, $http, $location) {
  $scope.iniciar = function() {
      $http.get('funciones_php/obtener_producto.php').success(function(data) { $scope.posts = data; console.log(data); });
      console.log("Ejecutado");
  };
  $scope.guardarDatos = function(obj){
    sessionStorage.setItem('producto', JSON.stringify(obj));
    console.log(sessionStorage.getItem("producto"));
  };
}]);
