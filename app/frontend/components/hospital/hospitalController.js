//(function () {
//    'use strict';
//    angular.module('saigon.controllers')
//})();
'use strick';
angular.module('saigonControllers', ['ui.bootstrap', function () {
    }])
    .controller('testingsController',
        ['$location', '$timeout', 'ngTableParams', 'exDialog', 'testingsService', '$window',
            function ($location, $timeout, ngTableParams, exDialog, testingsService, $window) {
                var vm = this;

                vm.message = '';
                vm.model = {};
                vm.showTestings = true;
                vm.tableParams = undefined;
                vm.tableParams = new ngTableParams(
                    {
                        page: 1,            // show first page
                        count: 10
                    },
                    {
                        defaultSort: 'asc',
                        getData: function ($defer, params) {
                            $defer.resolve(testingsService.query())
                        }
                    });

                //View details of testing form.
                vm.viewTestingDetails = function (id) {
                    $location.path("/testings/" + id);
                };
                activate();
                function activate() { }
            }])


    .controller('testingController',
        ['$location', '$timeout', 'ngTableParams', 'exDialog', 'testingService', '$route', 'hospitalService',
            function ($location, $timeout, ngTableParams, exDialog, testingService, $route, hospitalService) {
                var vm = this;

                var testingId = parseInt($route.current.params["id"]);
                vm.message = '';
                vm.model = {};
                vm.showTestings = true;
                vm.testing = undefined;

                vm.testing = testingService.query({ id: testingId },
                    function (data) {
                        vm.groups = hospitalService.query({ id: data.HospitalId});
                    },
                    function (error) {
                    });

                vm.isChecked = function (item, group) {
                    //console.log("check: ", vm.testing.Items, item, group, item.Id, group.Id);
                    var result = _.select(vm.testing.Items, function (i) {
                        console.log("inside: ",i, i.ItemId, i.ItemGroupId, item.Id, group.Id, (item.Id === i.ItemId) && (group.Id === i.ItemGroupId));
                        return (item.Id === i.ItemId) && (group.Id === i.ItemGroupId);
                    });
                    return (result.length > 0);

                    //for (var i = 0; i < vm.testing.Items.length; i++) {
                    //    var ii = vm.testing.Items[i];
                    //    if ((ii.ItemId === item.Id) && (ii.ItemGroupId === group.Id))
                    //        console.log("inside: ", ii, ii.ItemId, ii.ItemGroupId, item.Id, group.Id, (item.Id === ii.ItemId) && (group.Id === ii.ItemGroupId));
                    //        return true;
                    //}
                    //return false;
                }
            }])
    .controller('aboutController', ['$scope', function ($scope) {
        $scope.message = 'This is an example.';
    }]);


