const { chromium } = require('playwright');

(async () => {
    console.log("Chromium Path:", await chromium.executablePath());
})();