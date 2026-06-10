# Yoruba Terminology Dictionary

**Live site:** https://hakeemoadeniyan.github.io

A free, open, scholarly dictionary of coined Yoruba terms for science, technology, mathematics, education, economics, and general knowledge. All terms coined by **Hakeem Oluwafemi Adeniyan**.

---

## How to Add a New Word

1. Copy `_words/_TEMPLATE.md`
2. Rename the file using a URL-friendly slug of the Yoruba term (e.g. `komputa-alagebeka.md`)
3. Fill in all fields in the front matter
4. Commit and push to `main`
5. GitHub Actions builds and deploys the site automatically (2–3 minutes)
6. Your word is live at `https://hakeemoadeniyan.github.io/dictionary/your-slug/`

> **Note:** Do not forget to update `sitemap.xml` with the new word's URL after adding it.

---

## Repository Structure

```
hakeemoadeniyan.github.io/
├── .github/workflows/build.yml   # Auto-deploy on push
├── _words/                        # One .md file per coined word
│   ├── _TEMPLATE.md               # Copy this for new entries
│   ├── komputa-alagebeka.md
│   └── ilana-isiro.md
├── _layouts/
│   ├── default.html               # Base layout
│   └── dictionary.html            # Word entry layout (with citation box)
├── assets/css/styles.css          # All styling
├── _config.yml                    # Jekyll configuration
├── Gemfile                        # Ruby dependencies
├── index.html                     # Homepage with search & filter
├── dictionary.html                # Dictionary index page
├── about.md                       # About the author
├── robots.txt                     # Search engine crawl rules
├── sitemap.xml                    # Manual sitemap (update when adding words)
└── README.md
```

---

## Citing This Dictionary

**Individual word entry (APA 7th):**
```
Adeniyan, H. O. (Year, Month Day). Yoruba term (English meaning). In Yoruba Terminology Dictionary. Retrieved from https://hakeemoadeniyan.github.io/dictionary/word-slug/
```

**Full dictionary:**
```
Adeniyan, H. O. (2025). Yoruba Terminology Dictionary. Rose of Wisdom Ventures. https://hakeemoadeniyan.github.io
```

---

## Tech Stack

- **Jekyll** (static site generator)
- **GitHub Pages** (free hosting)
- **GitHub Actions** (auto-deploy)
- No database, no server, no monthly cost.
