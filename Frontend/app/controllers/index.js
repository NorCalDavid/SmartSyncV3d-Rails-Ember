SmartSync.IndexController = Ember.Controller.extend({
   needs: ['application'],

   isAuthenticated: Em.computed.alias('controllers.application.isAuthenticated'),
});
