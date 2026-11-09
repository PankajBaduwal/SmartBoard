# Nepal Digital Education — Smart Board

An interactive classroom whiteboard that runs entirely on your own computer: pen, highlighter, eraser, text, shapes and
instruments, tables, multiple pages, undo/redo, a Normal and a Scientific calculator, classroom games, simulations,
and a **History** of your boards from the last 2 days. No account, no backend and no internet are needed to draw and save.

## Run it (any computer)

You need **[Node.js](https://nodejs.org) 16 or newer** and a Chromium-based browser (**Microsoft Edge, Google Chrome, Chromium or Brave**).
There is nothing to install and no build step.

```bash
git clone https://github.com/PankajBaduwal/SmartBoard.git
cd SmartBoard
node launcher.js
```

(or `npm start`). The board opens in its own app window. Close the window and it stops.

| System | Easiest way |
|---|---|
| Windows | double-click **`Launch.vbs`** — it also adds a *Nepal Smart Board* shortcut to your Desktop |
| macOS | `./launch.sh` (first time: `chmod +x launch.sh`) |
| Linux | `./launch.sh` |
| Any (server / no window) | `node launcher.js --no-open`, then open the printed address in a browser |

No Edge/Chrome found? It opens your default browser instead and keeps running until you press Ctrl+C.
Use another port with `SMARTBOARD_PORT=6000 node launcher.js` (it also picks the next free port by itself).

## Your work

- **New board every time:** opening the Smart Board always starts a fresh, empty board. Refreshing the page (F5) keeps the board you are on.
- **History:** press the **History** button in the top bar to re-open any board from the last 2 days. Older boards are deleted automatically.
- Everything is stored on your computer (in the app's own browser profile): `%LOCALAPPDATA%\NepalSmartBoard` on Windows,
  `~/Library/Application Support/NepalSmartBoard` on macOS, `~/.local/share/NepalSmartBoard` on Linux. Nothing is sent anywhere.
- Save or export a board from the **File** menu.

## Windows: open it from a website

Running `Launch.vbs` once also registers a `nepalsmartboard://open` link for your Windows user (no administrator needed), so a school
dashboard can open this desktop app with one click. `cscript Launch.vbs /dry` shows what it would set up without changing anything.

## Things to know

- **Works offline:** drawing, shapes, text, calculator, pages, History and saving.
- **Known limitation:** importing PowerPoint / PDF files needs two helper libraries (JSZip, PDF.js) that the page loads from a CDN, and the page's content-security policy currently blocks them, so that import does not work yet (here or on the platform).
- **Platform features** (CDC textbooks, library simulations, cloud save, AI assistant, class sessions) need the Nepal Digital Education
  platform. When the board is opened from that platform it signs in and enables them; here it runs as a plain local board (`?local=1`).
- The launcher only listens on `127.0.0.1` (your own computer) and only serves files from this folder.

## Folder map

```
launcher.js     starts the local server and opens the app window (Node, no dependencies)
Launch.vbs      Windows double-click launcher (+ Desktop shortcut and nepalsmartboard:// link)
launch.sh       macOS / Linux launcher
index.html      the Smart Board
app.js          board controller, autosave and History
tools/          canvas, drawing, calculators, games, simulations engines
components/     UI pieces (History panel, controls dock, date, ...)
modules/        platform bridges (sign-in, cloud) — inactive in local mode
simulations/    curriculum simulation pages
styles/ assets/ chapters/ curriculum/ graph/
```

## Troubleshooting

- Nothing opens: run `node launcher.js` in a terminal to see messages, or read `launcher.log` in the data folder above.
- "Node.js is needed": install it from https://nodejs.org and try again.
