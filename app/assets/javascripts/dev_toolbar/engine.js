export default class Engine {
  static render() {
    console.log("hi hello from engine!")

    let thing = JSON.parse(document.querySelector("meta[name=dev_toolbar_config]").content)
    let html = ``
    for (let index = 0; index < thing.length; index++) {
      const link = thing[index];
      html += `<a href="${link.path}" target="_blank" class="dev-toolbar-link">${link.name}</a>`
    }
    const toolbar_html = `
      <div id="dev-toolbar">
        <div id="dev-toolbar-button">
          <button id="dev-toolbar-toggle">🛠️</button>
        </div>
        <div id="dev-toolbar-links" class="hidden">
          ${html}
        </div>
      </div>
    `
    document.body.insertAdjacentHTML('beforeend', toolbar_html)
  }

}
export { Engine }
