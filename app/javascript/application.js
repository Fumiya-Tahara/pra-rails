// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

import { Application } from "@hotwired/stimulus"
import { Modal } from "tailwindcss-stimulus-components"

const application = Application.start();
application.register("modal", Modal)

