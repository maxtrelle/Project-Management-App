
require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap";
import "./stylesheets/application.scss";
import "controllers";
import Sortable from "sortablejs";

document.addEventListener('turbolinks:load', () => {
  var el = document.getElementById('tasks-list');
  var sortable = Sortable.create(el);
})
