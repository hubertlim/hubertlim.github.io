# Hubert Krauze Personal Site

Personal website and blog for publishing DevOps, cloud, and security notes, with a strong focus on TryHackMe walkthroughs and hands-on learning.

## Stack

- Jekyll
- Chirpy theme
- GitHub Pages
- GitHub Actions
- Docker / Docker Compose for local development

## Project Structure

- `_posts` contains blog posts and walkthroughs
- `_tabs` contains top-level site pages
- `_data` contains author, contact, and sharing metadata
- `assets` contains images and theme assets
- `.github/workflows` contains the GitHub Pages deployment workflow

## Local Development

Run the site in Docker:

```powershell
docker compose up --build
```

The site will be available at `http://localhost:4000`.

## Validation

Build and validate the site in Docker:

```powershell
docker compose run --rm jekyll bash -lc "bundle exec jekyll b -d /tmp/site && bundle exec htmlproofer /tmp/site --disable-external --ignore-urls '/^http:\/\/127.0.0.1/,/^http:\/\/0.0.0.0/,/^http:\/\/localhost/'"
```

## Writing Workflow

1. Add a new Markdown post to `_posts` using the Jekyll date-based filename format.
2. Add front matter with a clear title, short description, focused categories, and topic-specific tags.
3. Use `pin: true` only for a small number of standout posts.
4. Enable `mermaid` only when a post includes Mermaid diagrams.

## Deployment

Pushes to `main` or `master` trigger the GitHub Pages workflow in [`.github/workflows/pages-deploy.yml`](.github/workflows/pages-deploy.yml).

## License

Published under the [MIT License](LICENSE).
