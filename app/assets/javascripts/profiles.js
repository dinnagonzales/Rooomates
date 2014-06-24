
function main() {
  return 'Hello, World!';
}

main();
var profileApp = angular.module('profile-app', ['ngResource']).config(
    ['$httpProvider', function($httpProvider) {
    var authToken = angular.element("meta[name=\"csrf-token\"]").attr("content");
    var defaults = $httpProvider.defaults.headers;

    defaults.common["X-CSRF-TOKEN"] = authToken;
    defaults.patch = defaults.patch || {};
    defaults.patch['Content-Type'] = 'application/json';
    defaults.common['Accept'] = 'application/json';
}]);

profileApp.factory('Profile', ['$resource', function($resource) {
  return $resource('/profiles/:id',
     {id: '@id'},
     {update: { method: 'PATCH'}});
}]);

profileApp.factory('Potential', ['$resource', function($resource) {
  return $resource('/potentials/:id',
     {id: '@id'},
     {update: { method: 'PATCH'}});
}]);


profileApp.controller('ProfileCtrl', ['Profile', 'Potential', '$scope', function(Profile, Potential, $scope) {
  $scope.profiles= [];
  $scope.newProfile = new Profile();
  $scope.potentials=[];
  
   $scope.profiles.options = [
              { id : "", name: "" }
             ,{ id : "", name: "" }
             ,{ id : ""  , name: "" }
             ];


 
  Potential.query(function(potentials) {
      $scope.potentials = potentials;
   });


  
  Profile.query(function(profiles) {
    $scope.profiles = profiles;
  });

    $scope.saveProfile = function () {
      $scope.newProfile.$save(function(profile) {
        $scope.profiles.push(profile);
        $scope.newProfile = new Profile();
        $route.reload();
        console.log('usersaved');
      });
    };


    $scope.savePotential = function (profile) {
        newPotential = new Potential({favorable_id: profile.id})
        newPotential.$save(function(potential) {
          $scope.potentials.push(potential);
          console.log('potentialsaved');
        });
    };
    


    $scope.showProfile = function(profile) {
      profile.details = true;
      profile.editing = false;
    };

    $scope.hideProfile = function(profile) {
      profile.details = false;
    };

    $scope.editProfile = function(profile) {
      profile.editing = true;
      profile.details = false;
    };

    $scope.updateProfile = function(profile) {
      profile.$update(function() {
        profile.editing = false;
      }, function(errors) {
        $scope.errors = errors.data;
      });
    };
  
    $scope.clearErrors = function() {
      $scope.errors = null;
    };

 
    // // ADDING POTENTIAL ROOOMATES

    
    
    // Potential.query(function(potentials) {
    // $scope.potentials = potentials;
    //  });

 //    $scope.addPotential = function(profile){
 //      $scope.newPotential = new Potential({
 //        user_name: profile.user.name,
 //        user_age: profile.user.age
      
 //      });
  
 //    $scope.newPotential.$save(function(profile){
 //    $scope.potential.push(profile);
 //    $scope.newPotential = new Potential();
 //    });
 //    };


 //    $scope.delete = function(profile){
 //      profile.$delete(function(){
 //      position = $scope.potential.indexOf(profile);
 //      }, function(errors) {
 //        $scope.errors = errors.data;
 //      });
 //    };
  }


]);

