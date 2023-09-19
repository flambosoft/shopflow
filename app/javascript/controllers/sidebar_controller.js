import {Controller} from "@hotwired/stimulus"


export default class extends Controller {
    static targets = ['sidebar', 'toggleSidebarEl', 'toggleSidebarMobileEl',
        'sidebarBackdrop', 'toggleSidebarMobileHamburger', 'toggleSidebarMobileClose',
        'toggleSidebarMobileSearch']

    connect() {
        document.querySelectorAll('#' + this.sidebarTarget.getAttribute('id') + ' ul > li > ul > li > a').forEach(e => {
            var fullText = e.textContent;
            var firstLetter = fullText.substring(0, 1);

            var fullTextEl = document.createElement('span');
            var firstLetterEl = document.createElement('span');
            firstLetterEl.classList.add('hidden');
            fullTextEl.textContent = fullText;
            firstLetterEl.textContent = firstLetter;

            e.textContent = '';
            e.appendChild(fullTextEl);
            e.appendChild(firstLetterEl);
        });
        if (localStorage.getItem('sidebarExpanded') !== null) {
            if (localStorage.getItem('sidebarExpanded') === 'true') {
                this.toggleSidebar(true, false);
            } else {
                this.toggleSidebar(false, true);
            }
        }

        this.toggleSidebarElTarget.addEventListener('click', () => {
            localStorage.setItem('sidebarExpanded', !this.isSidebarExpanded());
            this.toggleSidebar(!this.isSidebarExpanded(), true);
        });

        this.sidebarTarget.addEventListener('mouseenter', () => {
            if (!this.isSidebarExpanded())
                this.toggleSidebar(true);
        });

        this.sidebarTarget.addEventListener('mouseleave', () => {
            if (!this.isSidebarExpanded())
                this.toggleSidebar(false);
        });

        this.toggleSidebarMobileSearchTarget.addEventListener('click', this.toggleSidebarMobile.bind(this));

        this.toggleSidebarMobileElTarget.addEventListener('click', this.toggleSidebarMobile.bind(this));

        this.sidebarBackdropTarget.addEventListener('click', this.toggleSidebarMobile.bind(this));
    }

    toggleSidebar(expand, setExpanded = false) {
        const bottomMenuEl = document.querySelector('[sidebar-bottom-menu]');
        const mainContentEl = document.getElementById('main-content');
        if (expand) {
            this.sidebarTarget.classList.add('lg:w-64');
            this.sidebarTarget.classList.remove('lg:w-16');
            mainContentEl.classList.add('lg:ml-64');
            mainContentEl.classList.remove('lg:ml-16');

            document.querySelectorAll('#' + this.sidebarTarget.getAttribute('id') + ' [sidebar-toggle-item]').forEach(sidebarToggleEl => {
                sidebarToggleEl.classList.remove('lg:hidden');
                sidebarToggleEl.classList.remove('lg:absolute');
            });

            // toggle multi level menu item initial and full text
            document.querySelectorAll('#' + this.sidebarTarget.getAttribute('id') + ' ul > li > ul > li > a').forEach(e => {
                e.classList.add('pl-11');
                e.classList.remove('px-4');
                e.childNodes[0].classList.remove('hidden');
                e.childNodes[1].classList.add('hidden');
            });

            bottomMenuEl.classList.remove('flex-col', 'space-y-4', 'p-2');
            bottomMenuEl.classList.add('space-x-4', 'p-4');
            setExpanded ? this.toggleSidebarElTarget.setAttribute('aria-expanded', 'true') : null;
        } else {
            this.sidebarTarget.classList.remove('lg:w-64');
            this.sidebarTarget.classList.add('lg:w-16');
            mainContentEl.classList.remove('lg:ml-64');
            mainContentEl.classList.add('lg:ml-16');
            document.querySelectorAll('#' + this.sidebarTarget.getAttribute('id') + ' [sidebar-toggle-item]').forEach(sidebarToggleEl => {
                sidebarToggleEl.classList.add('lg:hidden');
                sidebarToggleEl.classList.add('lg:absolute');
            });

// toggle multi level menu item initial and full text
            document.querySelectorAll('#' + this.sidebarTarget.getAttribute('id') + ' ul > li > ul > li > a').forEach(e => {
                e.classList.remove('pl-11');
                e.classList.add('px-4');
                e.childNodes[0].classList.add('hidden');
                e.childNodes[1].classList.remove('hidden');
            });

            bottomMenuEl.classList.add('flex-col', 'space-y-4', 'p-2');
            bottomMenuEl.classList.remove('space-x-4', 'p-4');
            setExpanded ? this.toggleSidebarElTarget.setAttribute('aria-expanded', 'false') : null;
        }
    }

    isSidebarExpanded() {
        return this.toggleSidebarElTarget.getAttribute('aria-expanded') === 'true';
    }


    toggleSidebarMobile() {
        this.sidebarTarget.classList.toggle('hidden');
        this.sidebarBackdropTarget.classList.toggle('hidden');
        this.toggleSidebarMobileHamburgerTarget.classList.toggle('hidden');
        this.toggleSidebarMobileCloseTarget.classList.toggle('hidden');
    }
}