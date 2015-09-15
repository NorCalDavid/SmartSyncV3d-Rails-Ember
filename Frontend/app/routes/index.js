import Ember from 'ember';
import jQuery from 'jquery'

export default Ember.Route.extend({
  model: function() {
    return Ember.$.getJSON('/api/v1/users');
  }
});