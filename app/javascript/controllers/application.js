import { Application } from "@hotwired/stimulus"

import jQuery from "jquery"
window.jQuery = jQuery // <- "select2" will check this
window.$ = jQuery

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
