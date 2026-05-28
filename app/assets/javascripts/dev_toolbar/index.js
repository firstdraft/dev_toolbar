const STYLES = `
  #dev-toolbar {
    position: fixed;
    right: 0;
    top: 50vh;
    transform: translateY(-50%);
    background-color: #f0f0f0;
    border: 1px solid #ccc;
    z-index: 1000;
    display: flex;
    flex-direction: column;
    align-items: center;
    font-family: -apple-system, BlinkMacSystemFont, avenir next, avenir, segoe ui, helvetica neue, helvetica, Cantarell, Ubuntu, roboto, noto, arial, sans-serif;
    color: #808080;
  }

  #dev-toolbar-toggle {
    all: unset;
    font-size: 2em;
    border: none;
    cursor: pointer;
    line-height: 1.5;
    padding: 0 10px;
    text-decoration: none;
  }

  #dev-toolbar-links {
    display: flex;
    flex-direction: column;
  }

  .dev-toolbar-link {
    padding: 5px 10px;
    border-bottom: 1px #f0f0f0 solid;
    color: #808080;
    text-decoration: none;
    background-color: white;
  }

  #dev-toolbar-links.hidden {
    display: none;
  }
`

function injectStyles() {
  if (document.getElementById("dev-toolbar-styles")) return
  const style = document.createElement("style")
  style.id = "dev-toolbar-styles"
  style.textContent = STYLES
  document.head.appendChild(style)
}

function renderToolbar() {
  const configuration = document.querySelector("meta[name=dev_toolbar_config]")
  const defined_links = JSON.parse(configuration.content)
  let toolbar_links = ``
  for (let index = 0; index < defined_links.length; index++) {
    const link = defined_links[index];
    toolbar_links += `<a href="${link.path}" target="_blank" class="dev-toolbar-link">${link.name}</a>`
  }
  const toolbar_html = `
    <div id="dev-toolbar">
      <div id="dev-toolbar-button">
        <button id="dev-toolbar-toggle">🛠️</button>
      </div>
      <div id="dev-toolbar-links" class="hidden">
        ${toolbar_links}
      </div>
    </div>
  `
  document.body.insertAdjacentHTML('beforeend', toolbar_html)
}

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

document.addEventListener("turbo:load", function() {
  injectStyles();
  if (!document.getElementById("dev-toolbar")) {
    renderToolbar();
  }
  waitForElementToExist("#dev-toolbar-toggle").then( () => {
    document.getElementById("dev-toolbar-toggle").addEventListener("click", function() {
      var links = document.getElementById("dev-toolbar-links");
      links.classList.toggle("hidden");
    });
  });
});
