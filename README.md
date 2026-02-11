# Mechanisms of Differentiation in Platelet Formation via GRN Inference

A differential analysis of pySCENIC-inferred gene regulatory networks across MkP differentation pathways.

### Background

[Poscablo et. al. 2024](https://doi.org/10.1016/j.cell.2024.04.018) demonstrated that there exists an age-dependent platelet differentiation pathway in mice that branch off of the HSC root cell type (completely seperate from the rest of the hematopoietic tree). These aberrant platelets, dubbed 'non-canonical' platelets, are both produced and clot more aggressively, leading to greater risk of cardiac disease. 

In this analysis, the python package [pySCENIC](https://pyscenic.readthedocs.io/en/latest/) is used to infer regulatory relationships between transcription factors in old canonical and old non-canonical megakaryocyte progenitors (MkPs), a cell type that exists upstream of all platelets. Gene regulatory networks (GRNs) are inferred for each 'canon', visible through 'regulons' appended to the input experimental AnnData object with networks directly visible in [Cytoscape](https://cytoscape.org). 

- [Mechanisms of Differentiation in Platelet Formation via GRN Inference](#mechanisms-of-differentiation-in-platelet-formation-via-grn-inference)
    - [Background](#background)
  - [Prerequisites](#prerequisites)
  - [Setup](#setup)

## Prerequisites

Basic BASH shell proficiency is assumed. Mac users, this is built-in to your terminal. Windows users, please 

1. **Terminal Access**: Mac users use "Terminal". Windows users, please [install WSL2](https://learn.microsoft.com/en-us/windows/wsl/install) or another BASH-based terminal emulator of your choice (e.g. Git Bash). 

2. **Git**: used for version control, [install here](https://git-scm.com/install/).

3. **uv**: Our Python package manager. Ensures that code runs the same way, no matter the machine. [Install it here](https://docs.astral.sh/uv/getting-started/installation/).

4. (optionally) **docker**: If 

## Setup

To clone (download) this repository's contents, navigate to your parent directory of choice and run:
```bash
git clone https://github.com/akash-pandit/bnfo-analysis-template
cd bnfo-analysis-template 
```

To download all python dependencies and configure your environment, run:
```bash
uv sync  # yeah, its that easy.
```

To download pySCENIC's necessary genome feature and motif databases, run the following from the project root:
```bash
bash scripts/download_mm10_databases.sh
```
<!-- If running the above fails (only tested on Linux, known to fail on Windows), run it in a dedicated environment with the following docker commands:
```bash
docker build -t download-mm10-dbs -f docker/Dockerfile .  # . (or last path arg) should be project root
docker run --rm -v .:/app download-mm10-dbs 
``` -->


**For Jupyter users:** Launch jupyter with `uv` to ensure it uses the correct environment and navigate to one of the given URLs:
```bash
uv run jupyter lab
```

<!-- **For VSCode Users**: VSCode sometimes struggles to recognize a UV environment. To force VSCode's internal jupyter server to recognize a uv python environment, run the following line:
```bash
uv run python -m ipykernel install --user --name internal_env_name --display-name "Env Name"
``` -->
