// Create modal for profile image
const modal = document.createElement('div');
modal.className = 'modal';
modal.innerHTML = '<img src="" alt="Enlarged Profile">';
document.body.appendChild(modal);

// Profile image click handler
const profileImage = document.querySelector('.profile-image');
if (profileImage) {
    profileImage.addEventListener('click', function() {
        const modalImg = modal.querySelector('img');
        modalImg.src = this.src;
        modal.style.display = 'flex';
    });
}

// Close modal when clicking outside the image
modal.addEventListener('click', function(e) {
    if (e.target === this) {
        this.style.display = 'none';
    }
});

// Smooth scrolling for navigation links
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function(e) {
        e.preventDefault();
        const targetId = this.getAttribute('href');
        if (targetId === '#') return;
        
        const targetElement = document.querySelector(targetId);
        if (targetElement) {
            const headerOffset = 70; // Height of your fixed header
            const elementPosition = targetElement.getBoundingClientRect().top;
            const offsetPosition = elementPosition + window.pageYOffset - headerOffset;

            window.scrollTo({
                top: offsetPosition,
                behavior: 'smooth'
            });
        }
    });
});

// Add active class to current section in navigation
const sections = document.querySelectorAll('section');
const navLinks = document.querySelectorAll('.nav-links a');

function highlightNavigation() {
    let current = '';
    
    sections.forEach(section => {
        const sectionTop = section.offsetTop;
        const sectionHeight = section.clientHeight;
        
        if (pageYOffset >= sectionTop - 200) {
            current = '#' + section.getAttribute('id');
        }
    });

    navLinks.forEach(link => {
        link.classList.remove('active');
        if (link.getAttribute('href') === current) {
            link.classList.add('active');
        }
    });
}

window.addEventListener('scroll', highlightNavigation);
window.addEventListener('load', highlightNavigation);
