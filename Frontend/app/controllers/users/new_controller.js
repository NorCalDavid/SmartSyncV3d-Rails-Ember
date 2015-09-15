SmartSync.UsersNewController = Ember.Controller.extend({
   errors: {},
   errorMessage: '',
   reset: function() { this.setProperties({
                                             errors: {},
                                             errorMessage: '',
                                             name: '',
                                             email: '',
                                             username: '',
                                             password: '',
                                             password_confirmation: '' });
   },

   actions: {
      createUser: function() {
         var router = this.get('target');
         var data = this.getProperties('name', 'email', 'username', 'password', 'password_confirmation');
         var controller = this;
         var model = this.get('model');

         controller.set('errorMessage', '');
         controller.set('errors', {});

         $.post('/users', { user: data }, function(results) {
            SmartSync.AuthManager.authenticate(results.api_key.access_token, results.api_key.user_id);

            model.deleteRecord();

            router.transitionTo('index');
         }).fail(function(jqxhr, textStatus, error ) {
            if (jqxhr.responseText) {
               errs = JSON.parse(jqxhr.responseText);
               if (errs.message) {
                  controller.set('errorMessage', errs.message);
               }

               if (jqxhr.status === 422) {
                  controller.set('errors', errs.errors);
               }
            }
         });
      }
   }
});
