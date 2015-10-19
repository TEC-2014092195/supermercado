app.controller('actualizarCtrl', ['$scope', '$http', '$location', function($scope, $http, $location) {
  var imgsrc = "";
  var producto = JSON.parse(sessionStorage.getItem('producto'));
  // var $form = $('ui.form');
  // console.log(producto);
  // $form.form('set values',producto);

  // console.log(producto);
  $scope.act_producto = function(){
    producto.nombre = $scope.nombre;
    producto.cantidad = $scope.cantidad;
    producto.costo = $scope.costo;
    producto.precio_final = $scope.precio_final;
    producto.descuento = $scope.descuento;
    producto.foto = imgsrc;
    //console.log(JSON.stringify(producto));
    var $promise = $http.post('_core/components/actualizar/actualizar_producto.php',producto);
    $promise.then(function(msg) {
        // $scope.catalogoZona = msg.data;
    });
    location.reload();
    alert("Producto Actualizado");
    // volver a la página de la consulta de productos
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
