import Toolbar from "dev_toolbar/toolbar"

Toolbar.render();

function waitForElementToExist(selector) {
  return new Promise(resolve => {
    if (document.querySelector(selector)) {
      return resolve(document.querySelector(selector));
    }

    const observer = new MutationObserver(() => {
      if (document.querySelector(selector)) {
        resolve(document.querySelector(selector));
        observer.disconnect();
      }
    });

    observer.observe(document.body, {
      subtree: true,
      childList: true,
    });
  });
}

waitForElementToExist("#dev-toolbar-toggle").then( () => {
  document.getElementById("dev-toolbar-toggle").addEventListener("click", function() {
    var links = document.getElementById("dev-toolbar-links");
    links.classList.toggle("hidden");
  });
});
