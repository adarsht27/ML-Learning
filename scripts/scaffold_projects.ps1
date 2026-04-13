$projects = @(
  @{ id = "00-playground"; title = "00 Playground / Scratchpad"; hasData = $true },
  @{ id = "01-housing-regression"; title = "01 Housing Regression (OLS -> Ridge/Lasso)"; hasData = $true },
  @{ id = "02-education-classification"; title = "02 Education Classification (Logistic / kNN)"; hasData = $true },
  @{ id = "03-pipeline-imputation"; title = "03 Pipelines + Imputation (Leakage-safe)"; hasData = $true },
  @{ id = "04-diagnostics-thresholding"; title = "04 Diagnostics + Thresholding"; hasData = $false },
  @{ id = "05-fairness-audit"; title = "05 Fairness Audit Capstone"; hasData = $false },
  @{ id = "06-text-policy-sentiment"; title = "06 Text + Policy Sentiment (Optional)"; hasData = $true }
)

foreach ($p in $projects) {
  $base = Join-Path "projects" $p.id

  New-Item -ItemType Directory -Force -Path `
    (Join-Path $base "notebooks"),
    (Join-Path $base "reports"),
    (Join-Path $base "scripts") | Out-Null

  if ($p.hasData) {
    New-Item -ItemType Directory -Force -Path (Join-Path $base "data") | Out-Null
  }

  $readme = @"
# $($p.title)

## Policy question
(Write 1–2 lines.)

## Dataset
- Source:
- License/terms:
- How to get it: see `data/README.md` (if present) and `data/external/README.md`

## Methods
- Baseline:
- Improvements:

## Results (tl;dr)
- Metric:
- Key finding:

## Reproducibility
1) `uv sync`
2) `uv run jupyter lab`

## Limits & ethics
- Leakage risks:
- Fairness concerns:
- What I would do next:
"@

  $readme | Out-File -Encoding utf8 (Join-Path $base "README.md")

  "" | Out-File -Encoding utf8 (Join-Path $base "notebooks/.gitkeep")
  "" | Out-File -Encoding utf8 (Join-Path $base "reports/.gitkeep")

  @"
# Report (draft)

## Executive summary
...

## Data & preprocessing
...

## Modeling
...

## Evaluation
...

## Policy implications
...

## Limitations
...
"@ | Out-File -Encoding utf8 (Join-Path $base "reports/report.md")

  if ($p.hasData) {
    @"
# Data for $($p.title)

Put instructions here for downloading data into:
- `data/raw/$($p.id)/`
- `data/processed/$($p.id)/`

Do NOT commit raw/processed data.
"@ | Out-File -Encoding utf8 (Join-Path $base "data/README.md")

    @"
from pathlib import Path
import urllib.request

def download(url: str, out_path: Path) -> None:
    out_path.parent.mkdir(parents=True, exist_ok=True)
    if out_path.exists():
        print(f"Already exists, skipping: {out_path}")
        return
    print(f"Downloading {url} -> {out_path}")
    urllib.request.urlretrieve(url, out_path)
    print("Done.")

if __name__ == "__main__":
    # TODO: Replace with project dataset URL
    # Example:
    # download("https://example.com/data.csv", Path("data/raw/$($p.id)/data.csv"))
    pass
"@ | Out-File -Encoding utf8 (Join-Path $base "scripts/download_data.py")
  }
}

if (!(Test-Path "projects/README.md")) {
  @"
# Projects

Each project folder contains:
- `README.md` (story + results)
- `notebooks/` (exploration)
- `reports/` (final write-up)
- `scripts/` (download/export helpers)
"@ | Out-File -Encoding utf8 "projects/README.md"
}

Write-Host "Scaffold complete."