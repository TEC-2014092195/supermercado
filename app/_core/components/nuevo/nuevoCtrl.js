var imgsrc = "";
app.controller('nuevoCtrl', ['$scope', '$http', '$location', function($scope, $http, $location) {

    var producto = {};
    var reader = new FileReader();

    $(document)
        .ready(function() {
            $('.form')
                .form({
                    fields: {
                        codigo: {
                            identifier: 'codigo',
                            rules: [{
                                type: 'empty',
                                prompt: 'Por favor ingrese el código'
                            }]
                        },
                        nombre: {
                            identifier: 'nombre',
                            rules: [{
                                type: 'empty',
                                prompt: 'Por favor ingrese el nombre'
                            }]
                        },
                        cantidad: {
                            identifier: 'cantidad',
                            rules: [{
                                type: 'empty',
                                prompt: 'Por favor ingrese cantidad'
                            }]
                        },
                        costo: {
                            identifier: 'costo',
                            rules: [{
                                type: 'empty',
                                prompt: 'Por favor ingrese costo'
                            }]
                        },
                        precio_final: {
                            identifier: 'precio_final',
                            rules: [{
                                type: 'empty',
                                prompt: 'Por favor ingrese precio final'
                            }]
                        },
                        descuento: {
                            identifier: 'descuento',
                            rules: [{
                                type: 'empty',
                                prompt: 'Por favor ingrese descuento'
                            }]
                        }


                    },
                    inline: true,
                    on: 'blur'
                });
        });
    $scope.reg_producto = function() {

        var $form = $('.form');
        var $validateResult = $form.form('validate form');
        if ($validateResult) {
            producto.codigo = $scope.codigo;
            producto.nombre = $scope.nombre;
            producto.cantidad = $scope.cantidad;
            producto.costo = $scope.costo;
            producto.precio_final = $scope.precio_final;
            producto.descuento = $scope.descuento;
            producto.foto = imgsrc;
            console.log(JSON.stringify(producto));
            var $promise = $http.post('_core/components/nuevo/insertar_producto.php', producto);
            $promise.then(function(msg) {
                // $scope.catalogoZona = msg.data;
                console.log(msg.data);

            });
            alert("Producto Registrado");
            $location.path('/home');
        }else{
          alert('Ingrese todos los campos');
        }
    }

}]);

function previewFile() {
    var preview = document.querySelector('img');
    var file = document.querySelector('input[type=file]').files[0];
    var reader = new FileReader();

    reader.onloadend = function() {
        preview.src = reader.result;
        imgsrc = reader.result;
    }

    if (file) {
        reader.readAsDataURL(file);
    } else {
        preview.src = "";
    }
};
