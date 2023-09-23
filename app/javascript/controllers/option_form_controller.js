import {Controller} from "@hotwired/stimulus"


export default class extends Controller {
    static targets = ["optionValues", "optionValueTemplate", "removeLink",
        "optionType", "optionValueInput", "addOption"];

    connect() {
    }

    handleOptionTypeChange() {
        if (this.optionTypeTarget.value === 'choice') {
            this.ensureMinimumOptionValues();
        } else {
            this.removeAllOptionValues();
        }
    }

    addOptionValue(event) {
        event.preventDefault();
        this.insertOptionValue();
    }

    insertOptionValue() {
        const content = this.optionValueTemplateTarget.innerHTML.replace(/NEW_RECORD/g, new Date().getTime());
        this.optionValuesTarget.insertAdjacentHTML("beforeend", content);
    }

    removeOptionValue(event) {
        event.preventDefault();
        const wrapper = event.target.closest(".option-value-fields"); // Assuming each set of fields is wrapped in a div with class "option-value-wrapper"
        const destroyField = wrapper.querySelector(".option-value-destroy");

        if (destroyField) {
            destroyField.value = "1";
            wrapper.classList.add('hidden');
        } else {
            wrapper.remove();
        }
        this.ensureMinimumOptionValues();
    }

    removeAllOptionValues() {
        this.optionValuesTarget.innerHTML = ''; // This will remove all the option_value fields
    }

    ensureMinimumOptionValues() {
        if (this.optionValueInputTargets.length === 0) {
            this.insertOptionValue();
        }
    }
}