(function () {
    'use strict';

    angular.module('smartParty', [
            // Angular modules
            'ngRoute',
            'ngResource',
            'saigonControllers',
            'saigonFactories',
            'ui.bootstrap',
            'ngTable',
            'ngExDialog'



            // Custom modules

            // 3rd Party Modules

        ])
        //Configure the routes
        .config(['$routeProvider', function ($routeProvider) {
            $routeProvider

                .when('/', {
                    templateUrl: './Pages/index.html',
                    controller: 'homeController'
                })
                .when('/testings', {
                    templateUrl: './Pages/testings.html'
                })
                .when('/testings/:id', {
                    templateUrl: './Pages/testing.html'
                })
                .when('/registers', {
                    templateUrl: './Pages/registers.html',
                    controller: 'registersController'
                })
                .when('/hospitals', {
                    templateUrl: './components/hospital/hospitalView.html',
                    controller: 'hospitalsController'
                })
                .when('/about', {
                    templateUrl: './Pages/about.html',
                    controller: 'aboutController'
                });
            $routeProvider.otherwise({ redirectTo: '/' });

        }])
        .config(['$locationProvider', function ($locationProvider) {
            $locationProvider.html5Mode(true);
        }])

        //.config(['$stateProvider', function ($stateProvider) {
        //    $stateProvider
        //        .state("testing", {
        //            url: "/testing/",
        //            templateUrl: '/Pages/testing.html',
        //            controller: 'testingController'
        //        });
        //    $stateProvider.otherwise({redirectTo: '/'});
        //}])
        //Dialog default settings.
        //.config(['exDialogProvider', function (exDialogProvider) {
        //    exDialogProvider.setDefaults({
        //        template: 'ngExDialog/commonDialog.html',
        //        width: '330px',
        //        //closeByXButton: true,
        //        //closeByClickOutside: true,
        //        //closeByEscKey: true,
        //        //appendToElement: '',
        //        //beforeCloseCallback: '',
        //        //grayBackground: true,
        //        //cacheTemplate: true,
        //        //draggable: true,
        //        //animation: true,
        //        //messageTitle: 'Information',
        //        //messageIcon: 'info',
        //        //messageCloseButtonLabel: 'OK',
        //        //confirmTitle: 'Confirmation',
        //        //confirmIcon: 'question',
        //        //confirmActionButtonLabel: 'Yes',
        //        //confirmCloseButtonLabel: 'No'
        //    });
        //}])
    ;

})();



