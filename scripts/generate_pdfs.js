const puppeteer = require('puppeteer');
const fs = require('fs');
const path = require('path');

const OUTPUT_DIR = path.resolve(__dirname, '../docs/pdfs');
if (!fs.existsSync(OUTPUT_DIR)) fs.mkdirSync(OUTPUT_DIR, { recursive: true });

const PAGES = [
  { url: '/', filename: 'index' },
  { url: '/01-chart.html', filename: '01-chart' },
  { url: '/02-ers.html', filename: '02-ers' },
  { url: '/03-useCases.html', filename: '03-useCases' }
];

(async () => {
  const browser = await puppeteer.launch({ args: ['--no-sandbox', '--disable-setuid-sandbox'] });
  try {
    const page = await browser.newPage();
    for (const p of PAGES) {
      const url = `http://127.0.0.1:8080${p.url}`;
      console.log(`Rendering ${url} -> ${p.filename}.pdf`);
      await page.goto(url, { waitUntil: 'networkidle0', timeout: 60000 });

      const pdfPath = path.join(OUTPUT_DIR, `${p.filename}.pdf`);
      await page.pdf({
        path: pdfPath,
        format: 'A4',
        printBackground: true,
        margin: { top: '18mm', right: '12mm', bottom: '18mm', left: '12mm' },
        displayHeaderFooter: true,
        headerTemplate: '<div></div>',
        footerTemplate: `<div style="font-size:10px; width:100%; text-align:center; color: #444;">Página <span class="pageNumber"></span> de <span class="totalPages"></span></div>`
      });
      console.log(`Saved ${pdfPath}`);
    }
  } catch (err) {
    console.error('Error generating PDFs:', err);
    process.exitCode = 2;
  } finally {
    await browser.close();
  }
})();
