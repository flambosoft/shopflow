import {Controller} from "@hotwired/stimulus"


export default class extends Controller {
    static targets = [ "output" ]
    changeImageSlide(event) {
        let bigImg = document.getElementById("big-image");
        let imgs = document.querySelectorAll("#img-container img");
        let target = event.target;
        imgs.forEach((element) => element.classList.remove('border-sky-500'))
        target.classList.add("border-sky-500")
        bigImg.src = target.src
    }

    bigImageZoom() {
// this.outputTarget.classList.add("scale-150");

    }
}

