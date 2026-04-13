from pathlib import Path

def repo_root() -> Path:
    # src/ml_learning/paths.py -> repo root
    return Path(__file__).resolve().parents[2]

def data_dir() -> Path:
    return repo_root() / "data"

def raw_dir(project: str) -> Path:
    return data_dir() / "raw" / project

def processed_dir(project: str) -> Path:
    return data_dir() / "processed" / project
