SmartSync.SmartSynclicationController = Ember.Controller.extend({
   currentUser: function() {
      return SmartSync.AuthManager.get('apiKey.user')
   }.property('SmartSync.AuthManager.apiKey'),

   isAuthenticated: function() {
      return SmartSync.AuthManager.isAuthenticated()
   }.property('SmartSync.AuthManager.apiKey')
});
