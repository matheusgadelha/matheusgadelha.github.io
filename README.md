# matheusgadelha.github.io

Personal academic website. The site is built by a Python script (`compile_page.py`) that reads Markdown source files from `content/`, merges them into `content/template.html`, and writes the final `index.html`.

**Never edit `index.html` directly** — it is fully generated and will be overwritten on the next build.

---

## Building the site

Requires the `markdown` Python package:

```bash
pip install markdown
```

To regenerate `index.html` after any content change:

```bash
python compile_page.py content/template.html
```

---

## Repository layout

```
content/
  template.html     # HTML shell with {placeholders} for each section
  presentation.md   # Bio / intro text (plain Markdown)
  papers.md         # Publications list
  interns.md        # Mentored students list
  techtransfer.md   # Shipped software / tech transfer items
  experience.md     # Professional experience
  service.md        # Academic service (reviewing, etc.)
  tt_preamble.md    # Short preamble above the software section

compile_page.py     # Build script — reads content/, writes index.html
index.html          # Generated output — do not edit

fig/                # Images and videos used as thumbnails
css/                # Pico CSS framework
cv_source/          # CV source files (Typst) and compiled PDF
```

---

## Content format

Each section uses a simple custom block syntax parsed by `compile_page.py`.

### Papers — `content/papers.md`

```
:::paper
![](fig/thumbnail.png)
[[[Conference Year]]]
**Paper Title**

_Author One, **Matheus Gadelha**, Author Three_

[[Pre-print](https://arxiv.org/abs/XXXX.XXXXX)]
[[Project Page](https://example.com/project/)]
:::
```

- `[[[...]]]` becomes the article `<header>` (conference/venue label).
- `[[Pre-print](...)]` renders as a PDF icon link in the footer.
- `[[Project Page](...)]` renders as a globe icon link in the footer.
- Either link is optional — omit the line if there is no pre-print or no project page yet.
- The thumbnail is an `![](fig/...)` image. **Bold your name** with `**Matheus Gadelha**`.
- Papers are displayed in the order they appear in the file (most recent first by convention).

**Using a video as thumbnail** instead of a static image:

```
:::paper
<video autoplay loop muted playsinline><source src="fig/clip.mp4" type="video/mp4"></video>
[[[Conference Year]]]
...
:::
```

The build script automatically adds the `float-left` CSS class to both `<img>` and `<video>` thumbnail elements.

---

### Interns — `content/interns.md`

```
:::intern
[Name](https://their-website.com), University Name
now at Destination (optional)
:::
```

- The `now at` line is optional. It renders as small text below the name.
- Entries are laid out in three columns automatically.

---

### Software / Tech Transfer — `content/techtransfer.md`

```
:::tech
[[[Product Name]]]
![](fig/thumbnail.gif)
**Feature Name**

Short description.

[[Pre-print](https://...)]        ← optional
[[Project Page](https://...)]     ← optional
:::
```

Items are laid out in two columns automatically.

---

### Experience — `content/experience.md`

```
:::job
![](fig/company_logo.png)
**Company Name**.

Role (Location).

_Dates_.
:::
```

---

### Presentation / Bio — `content/presentation.md`

Plain Markdown. Rendered and inserted verbatim into the page header section.

---

### Service — `content/service.md`

Plain Markdown. Rendered and inserted into the service section.

---

## Adding a new paper (step by step)

1. Drop the thumbnail image or video into `fig/`.
2. Open `content/papers.md` and add a new `:::paper` block at the top of the file (or wherever it fits chronologically).
3. Run `python compile_page.py content/template.html` to regenerate `index.html`.
4. Commit both the source file(s) and the regenerated `index.html`.

## Changing the page layout or styles

Edit `content/template.html`. Styles live in an inline `<style>` block at the top. The template uses [Pico CSS](https://picocss.com/) (`css/pico.min.css`) for base styles.
