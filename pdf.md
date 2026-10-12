---
layout: default
title: "PDF Library"
description: "Downloadable PDF documents."
permalink: /pdf/
---

<div class="container pdf-library">

  <div class="dict-index-header">
    <h1>PDF Library</h1>
    <p>Downloadable PDF documents by Hakeem Oluwafemi Adeniyan. Read online or download for offline use.</p>
  </div>

  <div class="pdf-grid">
    {% assign all_pdfs = site.pdfs | sort: "title" %}
    {% for doc in all_pdfs %}
    <a href="{{ doc.url | relative_url }}" class="pdf-card">
      <div class="pdf-icon">📄</div>
      <h3 class="pdf-card-title">{{ doc.title }}</h3>
      {% if doc.subtitle %}
      <p class="pdf-card-subtitle">{{ doc.subtitle }}</p>
      {% endif %}
      <p class="pdf-card-desc">{{ doc.description | truncate: 120 }}</p>
      <span class="pdf-card-link">Read or Download →</span>
    </a>
    {% endfor %}
  </div>

</div>

<style>
.pdf-library { padding: 2rem 0 4rem; }
.pdf-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
  gap: 1.5rem;
  padding: 1.5rem 0 3rem;
}
.pdf-card {
  background: var(--white);
  border: 1px solid var(--border);
  border-radius: var(--radius);
  padding: 1.75rem 1.5rem;
  text-decoration: none;
  color: inherit;
  display: block;
  transition: box-shadow 0.2s, transform 0.2s, border-color 0.2s;
  position: relative;
  overflow: hidden;
}
.pdf-card::before {
  content: '';
  position: absolute;
  top: 0; left: 0;
  width: 4px; height: 100%;
  background: var(--ochre);
  transform: scaleY(0);
  transform-origin: bottom;
  transition: transform 0.2s;
}
.pdf-card:hover {
  box-shadow: var(--shadow);
  transform: translateY(-2px);
  border-color: var(--indigo-100);
  text-decoration: none;
}
.pdf-card:hover::before { transform: scaleY(1); }
.pdf-icon { font-size: 2rem; margin-bottom: 0.75rem; }
.pdf-card-title {
  font-family: var(--font-display);
  font-size: 1.15rem;
  font-weight: 700;
  color: var(--indigo-900);
  margin-bottom: 0.35rem;
  line-height: 1.3;
}
.pdf-card-subtitle {
  font-size: 0.85rem;
  color: var(--ochre);
  font-style: italic;
  margin-bottom: 0.6rem;
}
.pdf-card-desc {
  font-size: 0.85rem;
  color: var(--ink-muted);
  line-height: 1.6;
  margin-bottom: 1rem;
}
.pdf-card-link {
  font-size: 0.82rem;
  font-weight: 600;
  color: var(--indigo-700);
}
@media (max-width: 600px) {
  .pdf-grid { grid-template-columns: 1fr; }
}
</style>
