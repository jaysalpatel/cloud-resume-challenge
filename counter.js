async function visitcounter() {
    const path = window.location.host + window-location.pathname
    const url = "api endpoint"
    const response = await fetch(url)
    const json = response.json()
    document.getElementById('counter').innerText = json.count
}

visitcounter()