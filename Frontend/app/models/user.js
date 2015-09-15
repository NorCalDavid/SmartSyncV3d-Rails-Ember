import Model, { attr } from "ember-data/model";

export default Model.extend({
  id: attr(),
  name: attr(),
  username: attr(),
  email: attr(),
  picture: attr(),
  sign_in_count: attr(),
  current_sign_in_at: attr(),
  last_sign_in_at: attr(),
  current_sign_in_ip: attr(),
  last_sign_in_ip: attr()
});