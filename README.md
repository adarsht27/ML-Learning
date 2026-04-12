# ML-Learning

A personal machine learning portfolio repo focused on *policy-relevant* projects and reproducible workflows.

## Repo structure
- `projects/` — each project has its own README + notebooks + final reports
- `data/raw/`, `data/processed/` — ignored (not committed)
- `data/external/` — instructions + links to download data
- `docs/` — exported HTML reports for GitHub Pages
- `src/` — shared helper code (paths, metrics, plotting)
- `scripts/` — download/export scripts

## Setup (uv)
1. Install uv: https://docs.astral.sh/uv/
2. Create the environment and install dependencies:
   ```bash
   uv sync
   ```
3. Start Jupyter:
   ```bash
   uv run jupyter lab
   ```

## Data policy
Raw/processed data is **not** committed. See `data/external/README.md` for download instructions.

## Projects
- Project 01: Housing regression (planned)