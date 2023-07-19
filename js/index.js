document.addEventListener("DOMContentLoaded", () => {
    main();
});

//doesnt work. z index just doesnt seem to work at all on table cells? lol? cool story bro
function main(){
    let cards = document.querySelectorAll(".meme");

    cards.forEach((item, index) => {
        item.addEventListener("mouseenter", (ev) => {
            item.style.zIndex = -1000;
        });
        item.addEventListener("mouseleave", (ev) => {
            item.style.zIndex = 0;
        });
    });

}