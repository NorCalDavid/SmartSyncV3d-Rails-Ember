SmartSync.UsersController = Ember.ArrayController.extend({
   sortProperties: ['notAdmin', 'name'],
   sortAscending: true,

   notAdmin: function() {
    return !this.get('admin');
   }.property('admin'),
});