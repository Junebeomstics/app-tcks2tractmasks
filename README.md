<h1 align="center">app-tcks2tractmasks</h1>

<p align="center">
  Converts each .tck tract of a collection into a binary NIfTI tract mask on the grid of a reference FA image, using TractSeg's streamline-to-mask script with DIPY.
</p>

<p align="center">
  <a href="https://github.com/brainlife/abcd-spec"><img src="https://img.shields.io/badge/ABCD_Spec-v1.1-green.svg" alt="ABCD Spec v1.1"></a>
  <a href="https://doi.org/10.25663/brainlife.app.852"><img src="https://img.shields.io/badge/Brainlife-brainlife.app.852-blue.svg" alt="Run on brainlife.io"></a>
</p>

## At a glance

<!-- brainlife-app:begin (generated from the App manifest; edit the manifest, not this block) -->

> **Converts each .tck tract of a collection into a binary NIfTI tract mask on the grid of a reference FA image, using TractSeg's streamline-to-mask script with DIPY.**

For every .tck file the streamlines are upsampled, mapped to a density image on the FA voxel grid, binarised and cleaned of small blobs, and saved as a mask named after the tract. Use it to obtain tract masks for overlap, ROI or fractal-dimension analyses. The FA must share the affine of the DWI the tracts were made from.

| | |
|---|---|
| **Inputs** | `neuro/tcks` · `neuro/tensor` |
| **Outputs** | `neuro/tractmasks` |
| **Container** | `brainlife/dipy:1.4.1` |
| **Resources** | 1 CPUs · 0.33 h walltime |
| **Run it** | [doi.org/10.25663/brainlife.app.852](https://doi.org/10.25663/brainlife.app.852) |

#### Inputs

| Input | Datatype | Required | Description |
|---|---|---|---|
| `tcks` | `neuro/tcks` | yes | Collection of tract streamline files (.tck). |
| `tensor` | `neuro/tensor` | yes | Tensor maps; the FA image is used as the reference grid for the masks. |

#### Outputs

| Output | Datatype | Description |
|---|---|---|
| `masks` | `neuro/tractmasks` | One binary NIfTI mask per tract, named after the .tck file. |

<!-- brainlife-app:end -->

## Running the App

### On brainlife.io

Open the App at [doi.org/10.25663/brainlife.app.852](https://doi.org/10.25663/brainlife.app.852), choose `neuro/tcks`, `neuro/tensor` from your project and press **Execute**. The results are saved to your project as `neuro/tractmasks`.

### Locally

You need [Singularity/Apptainer](https://apptainer.org/) (the App runs in `brainlife/dipy:1.4.1`), [`jq`](https://jqlang.github.io/jq/).

1. Clone this repository.
2. Create `config.json` with the paths to your inputs and the parameters:

   ```json
   {
       "tcks": "/path/to/tcks/tcks",
       "tcks_json": "/path/to/tcks/tcks_json",
       "fa": "/path/to/tensor/fa",
       "md": "/path/to/tensor/md",
       "rd": "/path/to/tensor/rd",
       "ad": "/path/to/tensor/ad",
       "cl": "/path/to/tensor/cl",
       "cp": "/path/to/tensor/cp",
       "cs": "/path/to/tensor/cs",
       "tensors": "/path/to/tensor/tensors",
       "kurtosis": "/path/to/tensor/kurtosis",
       "ga": "/path/to/tensor/ga",
       "mk": "/path/to/tensor/mk",
       "ak": "/path/to/tensor/ak",
       "rk": "/path/to/tensor/rk",
       "rgb": "/path/to/tensor/rgb"
   }
   ```

3. Run `./main`.

## Pipeline Overview

| Step | Script | Description |
|------|--------|-------------|
| 1 | `main` | Reads `config.json`, sets up output directory, launches Singularity container |
| 2 | `scripts/convert_trk_to_nii.sh` | Iterates over all `.tck` files in the input folder |
| 3 | `scripts/trk_2_binary.py` | Upsamples streamlines, computes density map, saves binary mask |

---

## Citing

If you use this App, please cite it, the software it builds on and brainlife.io:

- app-tcks2tractmasks. brainlife.io App. [doi:10.25663/brainlife.app.852](https://doi.org/10.25663/brainlife.app.852)
- **DIPY**: Garyfallidis, E., et al. (2014). DIPY, a library for the analysis of diffusion MRI data. *Frontiers in Neuroinformatics, 8*, 8. [DOI: 10.3389/fninf.2014.00008](https://doi.org/10.3389/fninf.2014.00008)
- Wasserthal et al. TractSeg - Fast and accurate white matter tract segmentation. *NeuroImage* 183:239-253 (2018). [doi:10.1016/j.neuroimage.2018.07.070](https://doi.org/10.1016/j.neuroimage.2018.07.070)
- Hayashi S, Caron BA, Heinsfeld AS, et al. brainlife.io: a decentralized and open-source cloud platform to support neuroscience research. *Nature Methods* 21:809–813 (2024). [doi:10.1038/s41592-024-02237-2](https://doi.org/10.1038/s41592-024-02237-2)
- Avesani P, McPherson B, Hayashi S, et al. The open diffusion data derivatives, brain data upcycling via integrated publishing of derivatives and reproducible open cloud services. *Scientific Data* 6:69 (2019). [doi:10.1038/s41597-019-0073-y](https://doi.org/10.1038/s41597-019-0073-y)

## Authors

**Junbeom Kwon**

---

## Funding

[![Wellcome-226486/Z/22/Z](https://img.shields.io/badge/Wellcome-226486%2FZ%2F22%2FZ-purple.svg)](https://wellcome.org/)
[![NIH-NINDS-U24NS140384](https://img.shields.io/badge/NIH_NINDS-U24NS140384-green.svg)](https://reporter.nih.gov/project-details/11261037)
[![NIH-NINDS-UM1NS132207](https://img.shields.io/badge/NIH_NINDS-UM1NS132207-green.svg)](https://reporter.nih.gov/project-details/11411328)
[![NIH-NIBIB-R01EB029272](https://img.shields.io/badge/NIH_NIBIB-R01EB029272-green.svg)](https://reporter.nih.gov/project-details/10262925)
[![NIH-NIBIB-R01EB030896](https://img.shields.io/badge/NIH_NIBIB-R01EB030896-green.svg)](https://reporter.nih.gov/project-details/10428625)
[![NIH-NIMH-R01MH126699](https://img.shields.io/badge/NIH_NIMH-R01MH126699-green.svg)](https://reporter.nih.gov/project-details/10460628)
[![NIH-NIDCD-R01DC020088](https://img.shields.io/badge/NIH_NIDCD-R01DC020088-green.svg)](https://reporter.nih.gov/project-details/11140284)
[![NSF-BCS-1734853](https://img.shields.io/badge/NSF_BCS-1734853-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1734853)
[![NSF-BCS-2203524](https://img.shields.io/badge/NSF_BCS-2203524-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2203524)
[![NSF-IIS-1636893](https://img.shields.io/badge/NSF_IIS-1636893-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1636893)
[![NSF-OAC-2148729](https://img.shields.io/badge/NSF_OAC-2148729-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2148729)
[![NSF-IIS-1912270](https://img.shields.io/badge/NSF_IIS-1912270-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1912270)
[![NSF-IIS-2148700](https://img.shields.io/badge/NSF_IIS-2148700-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2148700)
[![NSF-OAC-1916518](https://img.shields.io/badge/NSF_OAC-1916518-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1916518)

<sub>brainlife.io, which runs this App, is publicly funded by Wellcome, the U.S. National Institutes of Health and the U.S. National Science Foundation; acknowledging that support helps keep it running.</sub>
