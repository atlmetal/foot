import { Controller } from "@hotwired/stimulus"
import "select2"

export default class extends Controller {
  initialize() {
    $('.js-example-basic-multiple').select2();
  }
}

