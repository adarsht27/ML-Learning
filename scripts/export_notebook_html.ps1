param(
  [Parameter(Mandatory=True)][string],
  [Parameter(Mandatory=True)][string]
)

# Exports a notebook to HTML using nbconvert inside the uv environment
uv run python -m nbconvert --to html  --output 
