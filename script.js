
// =====================================================
// LEARNHUB JAVASCRIPT
// =====================================================


// ===============================
// PAGE LOAD ANIMATION
// ===============================

document.addEventListener("DOMContentLoaded", function () {

    console.log(" Win's LearnHub Educational Portal Loaded Successfully!");

});


// ===============================
// CARD CLICK EFFECT
// ===============================

const cards =
    document.querySelectorAll(".feature-card");


cards.forEach(function (card) {

    card.addEventListener("mouseenter", function () {

        card.style.zIndex = "10";

    });


    card.addEventListener("mouseleave", function () {

        card.style.zIndex = "1";

    });

});


// ===============================
// SMOOTH SCROLL
// ===============================

const featureLinks =
    document.querySelectorAll('a[href="#features"]');


featureLinks.forEach(function (link) {

    link.addEventListener("click", function (event) {

        event.preventDefault();

        const features =
            document.getElementById("features");

        features.scrollIntoView({

            behavior: "smooth"

        });

    });

});


// ===============================
// NAVBAR SCROLL EFFECT
// ===============================

window.addEventListener("scroll", function () {

    const navbar =
        document.querySelector(".navbar");


    if (window.scrollY > 50) {

        navbar.style.background =
            "rgba(2, 6, 23, 0.97)";

        navbar.style.boxShadow =
            "0 5px 30px rgba(0, 0, 0, 0.3)";

    } else {

        navbar.style.background =
            "rgba(2, 6, 23, 0.88)";

        navbar.style.boxShadow =
            "none";

    }

});