app.controller('loginCtrl', function($scope, $http, $location) {
    $(document)
        .ready(function() {
            $('.form.login')
                .form({
                    fields: {
                        email: {
                            identifier: 'email',
                            rules: [{
                                type: 'empty',
                                prompt: 'Por favor ingrese su correo electrónico'
                            }, {
                                type: 'email',
                                prompt: 'Su correo no es correcto'
                            }]
                        },
                        password: {
                            identifier: 'password',
                            rules: [{
                                type: 'empty',
                                prompt: 'Por favor ingrese su contraseña'
                            }, {
                                type: 'length[1]',
                                prompt: 'Ingrese mínimo 1 caracter'
                            }]
                        },

                    },
                    inline: true,
                    on: 'blur'
                });
            $('.form.registro')
                .form({
                    fields: {
                        nombre: {
                            identifier: 'nombre',
                            rules: [{
                                type: 'empty',
                                prompt: 'Por favor ingrese su nombre'
                            }]
                        },
                        p_apellido: {
                            identifier: 'p_apellido',
                            rules: [{
                                type: 'empty',
                                prompt: 'Por favor ingrese su primer apellido'
                            }]
                        },
                        s_apellido: {
                            identifier: 's_apellido',
                            rules: [{
                                type: 'empty',
                                prompt: 'Por favor ingrese su segundo apellido'
                            }]
                        },
                        email: {
                            identifier: 'email',
                            rules: [{
                                type: 'empty',
                                prompt: 'Por favor ingrese su correo electrónico'
                            }, {
                                type: 'email',
                                prompt: 'Su correo no es correcto'
                            }]
                        },
                        password: {
                            identifier: 'password',
                            rules: [{
                                type: 'empty',
                                prompt: 'Por favor ingrese su contraseña'
                            }, {
                                type: 'length[1]',
                                prompt: 'Ingrese mínimo 1 caracter'
                            }]
                        },

                    },
                    inline: true,
                    on: 'blur'
                });

            $('.ui.modal')
                .modal({
                    blurring: true,
                    autofocus: false,
                    onHidden: function() {
                        console.log('Salió');
                        $('.form.registro').form('reset');
                        $scope.myImage = 'http://thesocietypages.org/socimages/files/2009/05/vimeo.jpg';
                        $scope.$apply();
                    },
                    onApprove: function() {
                        $scope.miImagen = $scope.myCroppedImage;
                        $scope.$apply();
                        //console.log('Aprobado');
                        var $form = $('.form.registro'),
                            allFields = $form.form('get values');
                        allFields.foto = $scope.myImage;
                        // console.log(allFields);
                        var $validateResult = $form.form('validate form');
                        if ($validateResult) {
                            var $dataBaseinsert = $http.post('_core/components/login/insertarUsuario.php', allFields);
                            $dataBaseinsert.then(function(message) {
                                var msgFinal = message.data;
                                if (msgFinal == "registrado") {
                                    alert("Su registro ha sido exitoso");
                                } else {
                                    alert("Ha ocurrido un error en su registro");
                                }
                            })
                        }
                    }
                })
                .modal('attach events', '.ui.message', 'show');
        });

    $scope.myImage = 'http://thesocietypages.org/socimages/files/2009/05/vimeo.jpg';
    var handleFileSelect = function(evt) {
        var file = evt.currentTarget.files[0];
        var reader = new FileReader();
        reader.onload = function(evt) {
            $scope.$apply(function($scope) {
                $scope.myImage = evt.target.result;
                // console.log($scope.myImage);
            });
        };
        reader.readAsDataURL(file);
    };
    angular.element(document.querySelector('#file')).on('change', handleFileSelect);
    $scope.login = function() {
        var $formLogin = $('.form.login'),
        allFields = $formLogin.form('get values');
        // console.log(allFields);
        var $validateResult = $formLogin.form('validate form');
        if ($validateResult) {
            $http.post('_core/components/login/loginUsuario.php',allFields)
            .then(function(message){
                
                if(message.data === "Not Found"){
                    alert('Intentelo de nuevo');
                }else{
                    $location.path('/home');
                    history.go(0);
                }
            });

        }
    }

});
