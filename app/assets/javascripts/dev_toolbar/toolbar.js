export default class Toolbar {
  static render() {
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

}
export { Toolbar }
