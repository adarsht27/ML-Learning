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
    # Example (UCI Adult)
    url = "https://archive.ics.uci.edu/ml/machine-learning-databases/adult/adult.data"
    out = Path("data/raw/adult/adult.data")
    download(url, out)