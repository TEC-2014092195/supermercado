app.controller('nuevoCtrl', ['$scope', '$http', '$location', function($scope, $http, $location) {
  var imgsrc = "";
  var producto = {};
  var reader  = new FileReader();
  $scope.reg_producto = function(){
    producto.codigo = $scope.codigo;
    producto.nombre = $scope.nombre;
    producto.cantidad = $scope.cantidad;
    producto.costo = $scope.costo;
    producto.precio_final = $scope.precio_final;
    producto.descuento = $scope.descuento;
    producto.foto = imgsrc;
    console.log(JSON.stringify(producto));
    var $promise = $http.post('_core/components/nuevo/insertar_producto.php',producto);
    $promise.then(function(msg) {
        // $scope.catalogoZona = msg.data;
    });
    location.reload();
    alert("Producto Registrado");
  }

}]);

function previewFile() {
  var preview = document.querySelector('img');
  var file    = document.querySelector('input[type=file]').files[0];
  var reader  = new FileReader();

  reader.onloadend = function () {
    preview.src = reader.result;
    imgsrc = reader.result;
  }

  if (file) {
    reader.readAsDataURL(file);
  } else {
    preview.src = "";
  }
};
