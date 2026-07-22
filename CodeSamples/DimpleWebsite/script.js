// script.js

document.addEventListener("DOMContentLoaded", () => {
    
    // --- Loader ---
    const loader = document.getElementById("loader");
    setTimeout(() => {
        loader.style.opacity = "0";
        setTimeout(() => {
            loader.style.display = "none";
            // Initialize AOS after loader completes
            AOS.init({
                duration: 1000,
                once: true,
                offset: 100,
            });

            // GSAP Hero Animation
            gsap.from(".badge", { y: -20, opacity: 0, duration: 1, delay: 0.2 });
            gsap.from(".hero h1", { x: -50, opacity: 0, duration: 1, delay: 0.4 });
            gsap.from(".hero p", { x: -50, opacity: 0, duration: 1, delay: 0.6 });
            gsap.from(".hero-buttons", { y: 30, opacity: 0, duration: 1, delay: 0.8 });
            gsap.from(".stats .stat-item", { y: 20, opacity: 0, duration: 1, stagger: 0.2, delay: 1 });
            
            gsap.from(".floating-icon", { scale: 0, opacity: 0, duration: 1, stagger: 0.2, delay: 1.5, ease: "back.out(1.7)" });
        }, 500);
    }, 1800);

    // --- Custom Cursor ---
    const cursor = document.querySelector(".cursor-glow");
    if(window.innerWidth > 768) {
        document.addEventListener("mousemove", (e) => {
            cursor.style.left = e.clientX + "px";
            cursor.style.top = e.clientY + "px";
        });
        document.addEventListener("mousedown", () => {
            cursor.style.transform = "translate(-50%, -50%) scale(0.7)";
            cursor.style.background = "rgba(255, 182, 193, 0.8)";
        });
        document.addEventListener("mouseup", () => {
            cursor.style.transform = "translate(-50%, -50%) scale(1)";
            cursor.style.background = "rgba(255, 182, 193, 0.6)";
        });
        const interactiveElements = document.querySelectorAll('a, button, .faq-item, .glass-card, input');
        interactiveElements.forEach(el => {
            el.addEventListener('mouseenter', () => {
                cursor.style.width = "60px";
                cursor.style.height = "60px";
                cursor.style.background = "rgba(215, 148, 196, 0.5)"; // Soft purple hint
                cursor.style.border = "1px solid rgba(255,255,255,0.8)";
            });
            el.addEventListener('mouseleave', () => {
                cursor.style.width = "30px";
                cursor.style.height = "30px";
                cursor.style.background = "rgba(255, 182, 193, 0.6)";
                cursor.style.border = "none";
            });
        });
    }

    // --- Navbar Scroll & Hamburger ---
    const navbar = document.getElementById("navbar");
    const backToTop = document.getElementById("backToTop");
    window.addEventListener("scroll", () => {
        if (window.scrollY > 50) {
            navbar.classList.add("scrolled");
            backToTop.style.display = "flex";
        } else {
            navbar.classList.remove("scrolled");
            backToTop.style.display = "none";
        }
    });

    const hamburger = document.querySelector(".hamburger");
    const navLinks = document.querySelector(".nav-links");
    hamburger.addEventListener("click", () => {
        navLinks.classList.toggle("active");
        if(navLinks.classList.contains("active")) {
            hamburger.innerHTML = '<i class="fas fa-times"></i>';
        } else {
            hamburger.innerHTML = '<i class="fas fa-bars"></i>';
        }
    });
    navLinks.querySelectorAll("a").forEach(link => {
        link.addEventListener("click", () => {
            navLinks.classList.remove("active");
            hamburger.innerHTML = '<i class="fas fa-bars"></i>';
        });
    });

    // --- Back to Top ---
    backToTop.addEventListener("click", () => {
        window.scrollTo({ top: 0, behavior: "smooth" });
    });

    // --- Animated Counters ---
    const counters = document.querySelectorAll('.counter');
    let counted = false;
    window.addEventListener('scroll', () => {
        const statsSection = document.querySelector('.stats');
        if(!statsSection) return;
        const sectionTop = statsSection.getBoundingClientRect().top;
        if(sectionTop < window.innerHeight && !counted) {
            counters.forEach(counter => {
                const target = +counter.getAttribute('data-target');
                const duration = 2000;
                const increment = target / (duration / 16);
                let current = 0;
                
                const updateCounter = () => {
                    current += increment;
                    if(current < target) {
                        counter.innerText = Math.ceil(current).toLocaleString();
                        requestAnimationFrame(updateCounter);
                    } else {
                        counter.innerText = target.toLocaleString();
                    }
                };
                updateCounter();
            });
            counted = true;
        }
    });

    // --- Mouse Parallax for Hero Image ---
    const heroImage = document.querySelector(".hero-image");
    const mockup = document.getElementById("hero-mockup");
    if(window.innerWidth > 768) {
        heroImage.addEventListener("mousemove", (e) => {
            const x = (window.innerWidth / 2 - e.pageX) / 30;
            const y = (window.innerHeight / 2 - e.pageY) / 30;
            mockup.style.transform = `rotateY(${x}deg) rotateX(${y}deg) translateZ(50px)`;
        });
        heroImage.addEventListener("mouseleave", () => {
            mockup.style.transform = `rotateY(0deg) rotateX(0deg) translateZ(50px)`;
        });
    }

    // --- Swiper Carousels ---
    new Swiper(".product-carousel", {
        slidesPerView: 1,
        spaceBetween: 30,
        loop: true,
        autoplay: {
            delay: 3500,
            disableOnInteraction: false,
        },
        pagination: {
            el: ".swiper-pagination",
            clickable: true,
        },
        breakpoints: {
            768: { slidesPerView: 2 },
            1024: { slidesPerView: 3 }
        }
    });

    new Swiper(".reviews-slider", {
        slidesPerView: 1,
        spaceBetween: 30,
        loop: true,
        autoplay: {
            delay: 5000,
            disableOnInteraction: false,
        },
        navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
        },
        breakpoints: {
            768: { slidesPerView: 2 },
            1024: { slidesPerView: 3 }
        }
    });

    // --- FAQ Accordion ---
    const faqItems = document.querySelectorAll(".faq-item");
    faqItems.forEach(item => {
        item.addEventListener("click", () => {
            const isActive = item.classList.contains("active");
            faqItems.forEach(i => i.classList.remove("active"));
            if (!isActive) {
                item.classList.add("active");
            }
        });
    });

    // --- Countdown Timer ---
    // Fixed logic to keep countdown active
    let countDownDate = localStorage.getItem('dimpleGlowCountdown');
    if (!countDownDate) {
        countDownDate = new Date().getTime() + (2 * 24 * 60 * 60 * 1000) + (13 * 60 * 60 * 1000); // 2d 13h
        localStorage.setItem('dimpleGlowCountdown', countDownDate);
    }

    const timer = setInterval(() => {
        const now = new Date().getTime();
        const distance = countDownDate - now;

        if (distance < 0) {
            // Reset if expired
            countDownDate = new Date().getTime() + (2 * 24 * 60 * 60 * 1000);
            localStorage.setItem('dimpleGlowCountdown', countDownDate);
        }

        const days = Math.floor(distance / (1000 * 60 * 60 * 24));
        const hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        const minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
        const seconds = Math.floor((distance % (1000 * 60)) / 1000);

        const dEl = document.getElementById("days");
        if(dEl) {
            dEl.innerText = days.toString().padStart(2, '0');
            document.getElementById("hours").innerText = hours.toString().padStart(2, '0');
            document.getElementById("minutes").innerText = minutes.toString().padStart(2, '0');
            document.getElementById("seconds").innerText = seconds.toString().padStart(2, '0');
        }
    }, 1000);

    // --- Confetti on Buy Button ---
    const buyBtn = document.querySelector(".buy-confetti");
    if(buyBtn) {
        buyBtn.addEventListener("click", (e) => {
            e.preventDefault();
            confetti({
                particleCount: 200,
                spread: 100,
                origin: { y: 0.6 },
                colors: ['#ffb6c1', '#e6a8d7', '#ffffff', '#ffd700']
            });
            setTimeout(()=> {
                alert("Thank you for trying out our fictional demo! No purchase was made.");
            }, 1500);
        });
    }

    const buyDemoBtns = document.querySelectorAll(".buy-demo");
    buyDemoBtns.forEach(btn => {
        btn.addEventListener("click", (e) => {
            e.preventDefault();
            alert("This is a demo UI. Purchase functionality is disabled.");
        });
    });

    // --- Floating Particles (Hearts & Sparkles) ---
    const particlesContainer = document.getElementById("particles-container");
    const createParticle = () => {
        if(document.hidden) return; // Don't create particles if tab is hidden
        
        const particle = document.createElement("i");
        const rand = Math.random();
        
        if (rand > 0.6) particle.className = "fas fa-heart";
        else if (rand > 0.3) particle.className = "fas fa-sparkles";
        else particle.className = "fas fa-star";
        
        const size = Math.random() * 15 + 8;
        particle.style.fontSize = `${size}px`;
        
        if(particle.className.includes("heart")) particle.style.color = "rgba(255, 182, 193, 0.4)";
        else if(particle.className.includes("star")) particle.style.color = "rgba(255, 215, 0, 0.3)";
        else particle.style.color = "rgba(255, 255, 255, 0.6)";

        particle.style.position = "absolute";
        particle.style.left = `${Math.random() * 100}vw`;
        particle.style.top = `${Math.random() * 100}vh`;
        particle.style.opacity = "0";
        
        particlesContainer.appendChild(particle);

        gsap.to(particle, {
            y: -150 - Math.random() * 100,
            x: (Math.random() - 0.5) * 80,
            rotation: (Math.random() - 0.5) * 360,
            opacity: 1,
            duration: 3 + Math.random() * 4,
            ease: "power1.out",
            onComplete: () => {
                gsap.to(particle, {
                    opacity: 0,
                    duration: 1,
                    onComplete: () => particle.remove()
                });
            }
        });
    };

    // Create particles periodically
    setInterval(createParticle, 800);
    // Create initial batch
    for(let i=0; i<15; i++) { setTimeout(createParticle, i * 100); }

    // --- Form Submission ---
    const nsForm = document.getElementById("newsletter-form");
    if(nsForm) {
        nsForm.addEventListener("submit", (e) => {
            e.preventDefault();
            
            const btn = nsForm.querySelector('button');
            const originalHTML = btn.innerHTML;
            btn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Subscribing...';
            
            setTimeout(() => {
                btn.innerHTML = '<i class="fas fa-check"></i> Subscribed!';
                btn.style.background = '#25D366';
                btn.style.boxShadow = '0 4px 15px rgba(37, 211, 102, 0.4)';
                
                confetti({
                    particleCount: 50,
                    spread: 40,
                    origin: { y: 0.8 },
                    colors: ['#25D366', '#ffffff']
                });
                
                setTimeout(() => {
                    alert("Thanks for subscribing to our fictional demo newsletter!");
                    e.target.reset();
                    btn.innerHTML = originalHTML;
                    btn.style.background = '';
                    btn.style.boxShadow = '';
                }, 2000);
            }, 1500);
        });
    }

    // --- Ripple Effect for Buttons ---
    const ripples = document.querySelectorAll('.ripple');
    ripples.forEach(btn => {
        btn.addEventListener('click', function (e) {
            let x = e.clientX - e.target.getBoundingClientRect().left;
            let y = e.clientY - e.target.getBoundingClientRect().top;
            let rippleEl = document.createElement('span');
            rippleEl.style.left = x + 'px';
            rippleEl.style.top = y + 'px';
            rippleEl.style.position = 'absolute';
            rippleEl.style.background = 'rgba(255,255,255,0.6)';
            rippleEl.style.borderRadius = '50%';
            rippleEl.style.transform = 'translate(-50%, -50%)';
            rippleEl.style.animation = 'rippleAnim 0.8s linear';
            rippleEl.style.pointerEvents = 'none'; // so it doesn't block clicks
            
            this.appendChild(rippleEl);
            setTimeout(() => rippleEl.remove(), 800);
        });
    });

    // Add ripple animation dynamically
    const style = document.createElement('style');
    style.innerHTML = `
        @keyframes rippleAnim {
            0% { width: 0; height: 0; opacity: 0.8; }
            100% { width: 400px; height: 400px; opacity: 0; }
        }
    `;
    document.head.appendChild(style);
});
