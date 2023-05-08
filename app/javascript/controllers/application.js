import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
$(".list_question").select2();
$("#question_question_type").on("change", function() {
    var type = $(this).val();
    switch (type) {
        case "single_choice":
           $('.is_correct').attr('type', 'radio')
           break;
        case "multiple_choice":
           $('.is_correct').attr('type', 'checkbox')
           break;
      }
})

$("#add_answer").on("click", function() {
    var type = $("#question_question_type").val();
    switch (type) {
        case "single_choice":
           $('.is_correct').attr('type', 'radio')
          break;
        case "multiple_choice":
           $('.is_correct').attr('type', 'checkbox')
           break;
      }
})
