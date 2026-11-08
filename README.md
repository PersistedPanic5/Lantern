# Lantern

A map and notes tool for D&D game masters. Load a dungeon map, import the adventure text
(paste it, or import a PDF), link each room to its text, and run a second "player screen"
window with fog of war on a TV or projector.

Everything runs in the browser. Maps, texts and fog are stored only in the browser that
opened Lantern (IndexedDB). Nothing is uploaded anywhere.

## Files

- `index.html` – the whole app (includes PDF.js for PDF import).
- `lantern-ocr.js` – optional add-on for scanned PDFs (OCR with Czech and English).
  Lantern loads it only when you choose to read scanned pages.

## Use it offline

Download both files into one folder and open `index.html` in Chrome or Edge.

## Sharing a campaign

Use **Export** to download one `.json` file with all maps (images included), texts, rooms
and fog. Someone else opens it with **Open campaign**.

## Adventure content

Lantern contains no adventure content. Import only books you own, and don't publish
exported campaigns that contain copyrighted text or maps.

## Third-party software

- PDF.js 3.11.174 – Mozilla, Apache License 2.0
- Tesseract.js 7.0.0 and tesseract.js-core 7.0.0 – Apache License 2.0
- Tesseract language data (ces, eng; tessdata best_int) – Apache License 2.0

## Publishing updates

`deploy.ps1` (Windows) and `deploy.sh` (macOS/Linux) copy a new `lantern.html` from your
Downloads folder over `index.html`, then commit and push. The site updates about a minute later.
