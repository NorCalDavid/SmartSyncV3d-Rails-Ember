import Ember from 'ember';
import Resolver from 'ember/resolver';
import loadInitializers from 'ember/load-initializers';
import config from './config/environment';

var SmartSync;

Ember.MODEL_FACTORY_INJECTIONS = true;

SmartSync = Ember.Application.extend({
  modulePrefix: config.modulePrefix,
  podModulePrefix: config.podModulePrefix,
  Resolver: Resolver
});

loadInitializers(SmartSync, config.modulePrefix);

export default SmartSync;
