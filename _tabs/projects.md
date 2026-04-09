---
title: Projects
description: Selected applications, live demos, and engineering case studies.
icon: fas fa-diagram-project
order: 4
permalink: /projects/
---

{% assign featured_projects = site.data.projects | where: "featured", true %}

<style>
  .projects-hero {
    margin-bottom: 2rem;
  }

  .projects-kicker {
    display: inline-block;
    margin-bottom: 0.75rem;
    padding: 0.2rem 0.65rem;
    border-radius: 999px;
    font-size: 0.78rem;
    font-weight: 700;
    letter-spacing: 0.04em;
    text-transform: uppercase;
    color: #8b5cf6;
    background: rgba(139, 92, 246, 0.12);
  }

  .projects-lead {
    max-width: 56rem;
    color: var(--text-muted-color, #6b7280);
    font-size: 1.02rem;
  }

  .projects-grid {
    display: grid;
    gap: 1.5rem;
  }

  .project-card {
    overflow: hidden;
    border: 1px solid rgba(148, 163, 184, 0.22);
    border-radius: 1.25rem;
    background:
      radial-gradient(circle at top right, rgba(56, 189, 248, 0.1), transparent 28%),
      linear-gradient(180deg, rgba(15, 23, 42, 0.02), rgba(15, 23, 42, 0.06));
    box-shadow: 0 16px 50px rgba(15, 23, 42, 0.08);
  }

  .project-media {
    border-bottom: 1px solid rgba(148, 163, 184, 0.18);
    background: #0f172a;
  }

  .project-media img {
    display: block;
    width: 100%;
    aspect-ratio: 16 / 9;
    object-fit: cover;
  }

  .project-body {
    padding: 1.35rem;
  }

  .project-meta {
    display: flex;
    flex-wrap: wrap;
    gap: 0.5rem;
    margin-bottom: 0.9rem;
  }

  .project-badge {
    display: inline-flex;
    align-items: center;
    padding: 0.25rem 0.7rem;
    border-radius: 999px;
    font-size: 0.75rem;
    font-weight: 700;
    line-height: 1.2;
  }

  .project-badge.status {
    color: #0f766e;
    background: rgba(20, 184, 166, 0.14);
  }

  .project-badge.category {
    color: #1d4ed8;
    background: rgba(59, 130, 246, 0.12);
  }

  .project-title {
    margin-bottom: 0.45rem;
    font-size: 1.7rem;
    line-height: 1.15;
  }

  .project-hook {
    margin-bottom: 0.95rem;
    color: var(--heading-color, #111827);
    font-size: 1.05rem;
    font-weight: 600;
  }

  .project-summary {
    margin-bottom: 1.2rem;
    color: var(--text-muted-color, #6b7280);
  }

  .project-section-title {
    margin-bottom: 0.6rem;
    font-size: 0.82rem;
    font-weight: 800;
    letter-spacing: 0.05em;
    text-transform: uppercase;
    color: var(--heading-color, #111827);
  }

  .project-highlights {
    margin: 0 0 1.2rem 1.1rem;
  }

  .project-highlights li + li {
    margin-top: 0.45rem;
  }

  .project-stack {
    display: flex;
    flex-wrap: wrap;
    gap: 0.55rem;
    margin-bottom: 1.25rem;
  }

  .project-stack span {
    display: inline-flex;
    align-items: center;
    padding: 0.4rem 0.75rem;
    border: 1px solid rgba(148, 163, 184, 0.22);
    border-radius: 999px;
    font-size: 0.82rem;
    background: rgba(148, 163, 184, 0.08);
  }

  .project-links {
    display: flex;
    flex-wrap: wrap;
    gap: 0.8rem;
    align-items: center;
  }

  .project-link {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    padding: 0.62rem 0.95rem;
    border-radius: 0.8rem;
    font-weight: 700;
    text-decoration: none;
    transition: transform 0.15s ease, box-shadow 0.15s ease;
  }

  .project-link:hover {
    transform: translateY(-1px);
    text-decoration: none;
  }

  .project-link.primary {
    color: #fff;
    background: linear-gradient(135deg, #0f766e, #0f4c81);
    box-shadow: 0 8px 24px rgba(15, 118, 110, 0.24);
  }

  .project-link.secondary {
    color: var(--heading-color, #111827);
    border: 1px solid rgba(148, 163, 184, 0.28);
    background: rgba(255, 255, 255, 0.4);
  }

  .project-note {
    color: var(--text-muted-color, #6b7280);
    font-size: 0.92rem;
    font-style: italic;
  }

  .projects-next {
    margin-top: 1.75rem;
    padding: 1rem 1.15rem;
    border: 1px dashed rgba(148, 163, 184, 0.4);
    border-radius: 1rem;
    color: var(--text-muted-color, #6b7280);
    background: rgba(148, 163, 184, 0.05);
  }

  @media (min-width: 960px) {
    .project-card.featured {
      display: grid;
      grid-template-columns: minmax(0, 1.1fr) minmax(0, 1fr);
    }

    .project-card.featured .project-media {
      border-right: 1px solid rgba(148, 163, 184, 0.18);
      border-bottom: 0;
    }

    .project-card.featured .project-media img {
      height: 100%;
    }
  }
</style>

<section class="projects-hero">
  <span class="projects-kicker">Application Portfolio</span>
  <h1>Projects built to be used, inspected, and explained.</h1>
  <p class="projects-lead">
    This section highlights selected applications with live demos, source code, and
    engineering context. The goal is to show not only what I built, but also the technical
    decisions, constraints, and tradeoffs behind each project.
  </p>
</section>

<section class="projects-grid">
  {% for project in featured_projects %}
    <article class="project-card featured">
      {% if project.image %}
        <div class="project-media">
          <img src="{{ project.image | relative_url }}" alt="{{ project.name }} preview" />
        </div>
      {% endif %}

      <div class="project-body">
        <div class="project-meta">
          {% if project.status %}
            <span class="project-badge status">{{ project.status }}</span>
          {% endif %}
          {% if project.category %}
            <span class="project-badge category">{{ project.category }}</span>
          {% endif %}
        </div>

        <h2 class="project-title">{{ project.name }}</h2>
        <p class="project-hook">{{ project.hook }}</p>
        <p class="project-summary">{{ project.summary }}</p>

        <div class="project-section-title">Engineering Highlights</div>
        <ul class="project-highlights">
          {% for item in project.highlights %}
            <li>{{ item }}</li>
          {% endfor %}
        </ul>

        <div class="project-section-title">Stack</div>
        <div class="project-stack">
          {% for item in project.stack %}
            <span>{{ item }}</span>
          {% endfor %}
        </div>

        <div class="project-links">
          <a class="project-link primary" href="{{ project.live_url }}" target="_blank" rel="noopener noreferrer">Live Demo</a>
          <a class="project-link secondary" href="{{ project.repo_url }}" target="_blank" rel="noopener noreferrer">GitHub</a>
          {% if project.article_url %}
            <a class="project-link secondary" href="{{ project.article_url | relative_url }}">Case Study</a>
          {% else %}
            <span class="project-note">Case study in progress: {{ project.article_teaser }}</span>
          {% endif %}
        </div>
      </div>
    </article>
  {% endfor %}
</section>

<aside class="projects-next">
  More GitHub Pages projects can be added by extending <code>_data/projects.yml</code>. This
  page is intentionally data-driven so each project can keep the same professional structure:
  preview, technical hook, engineering highlights, stack, and links to the live demo, source,
  and article.
</aside>
