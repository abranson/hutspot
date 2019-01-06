// See https://github.com/llelectronics/webcat/blob/master/qml/pages/helper/

if (!window.location.origin)
   window.location.origin = window.location.protocol+"//"+window.location.host;

var origWidth = screen.width
var dpr = 1.5

// Not sure if this will work on all resolutions
// Jolla devicePixelRatio: 1.5
// Nexus 4 devicePixelRatio: 2.0
// Nexus 5 devicePixelRatio: 3.0

if (origWidth <= 540)
    dpr = 1.5;
else if (origWidth > 540 && origWidth <= 768)
    dpr = 2.0;
else if (origWidth > 768)
    dpr = 3.0;

var dprWidth = origWidth / dpr

function setPixelRatio() {
    // Glorious hack to fix wrong device Pixel Ratio reported by Webview (I hope Jolla will fix this soon)
    document.querySelector("meta[name=viewport]").setAttribute('content', 'width=device-width, initial-scale='+(dpr));
}

window.addEventListener("DOMContentLoaded", function(event){
    setPixelRatio();
}, true);


setPixelRatio();
