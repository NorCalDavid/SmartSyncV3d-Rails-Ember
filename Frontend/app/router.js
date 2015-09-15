import Ember from 'ember';
import config from './config/environment';

var Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {

  this.route('sessions', function() {
    this.route('new', { path: '/sessions/new'});
    this.route('delete', { path: '/sessions/delete'});
  });

  this.route('users', function() {
    this.route('show_user', { path: '/user/:user_id'});
    this.route('new_user', { path: '/users'});
    this.route('edit_user', { path: '/user/:user_id/edit'});
    this.route('update_user', { path: '/user/:user_id'});
    this.route('delete_user', { path: '/user/:user_id'});
    this.route('myProperties', { path: '/user/:user_id/properties'});
    this.route('myRooms', { path: '/user/:user_id/rooms'});
    this.route('myDevices', { path: '/user/:user_id/devices'});
  });

  this.route('properties', function() {
    this.route('show_property', { path: '/properties/:property_id'});
    this.route('new_property', { path: '/properties'});
    this.route('edit_property', { path: '/properties/:property_id/edit'});
    this.route('update_property', { path: '/properties/:property_id'});
    this.route('delete_property', { path: '/properties/:property_id'});
  });

  this.route('rooms', function() {
    this.route('show_room', { path: '/rooms/:roomroom_id'});
    this.route('new_room', { path: '/rooms'});
    this.route('edit_room', { path: '/rooms/:room_id/edit'});
    this.route('update_room', { path: '/rooms/:room_id'});
    this.route('delete_room', { path: '/rooms/:room_id'});
  });

  this.route('devices', function() {
    this.route('show_device', { path: '/devices/:device_id'});
    this.route('new_device', { path: '/devices'});
    this.route('edit_device', { path: '/devices/:device_id/edit'});
    this.route('update_device', { path: '/devices/:device_id'});
    this.route('delete_device', { path: '/devices/:device_id'});
  });

});

export default Router;
