<h1 align="center">Tract Shape Analysis</h1>

<p align="center">
  Computes tract shape measures (length, span, area, volume, elongation, curvature, torsion and more) for each tract in a tcks folder with DSI Studio and DIPY and merges them into one tractmeasures CSV.
</p>

<p align="center">
  <a href="https://github.com/brainlife/abcd-spec"><img src="https://img.shields.io/badge/ABCD_Spec-v1.1-green.svg" alt="ABCD Spec v1.1"></a>
  <a href="https://doi.org/10.25663/brainlife.app.844"><img src="https://img.shields.io/badge/Brainlife-brainlife.app.844-blue.svg" alt="Run on brainlife.io"></a>
</p>

## At a glance

<!-- brainlife-app:begin (generated from the App manifest; edit the manifest, not this block) -->

> **Computes tract shape measures (length, span, area, volume, elongation, curvature, torsion and more) for each tract in a tcks folder with DSI Studio and DIPY and merges them into one tractmeasures CSV.**

Converts each .tck to .trk using a reference image, computes geometric shape statistics with DSI Studio and curvature/torsion with DIPY, and stacks and merges them into stat/tractmeasures.csv. Only one reference image is needed: the first available of T1w, T2w, parcellation or mask is used. Use it to characterise tract morphology for group analyses.

| | |
|---|---|
| **Inputs** | `neuro/tcks` · `neuro/anat/t1w` (optional) · `neuro/anat/t2w` (optional) · `neuro/mask` (optional) · `neuro/parcellation/volume` (optional) |
| **Outputs** | `neuro/tractmeasures` |
| **Container** | `brainlife/dipy:1.4.1` |
| **Resources** | 1 CPUs · 0.92 h walltime |
| **Run it** | [doi.org/10.25663/brainlife.app.844](https://doi.org/10.25663/brainlife.app.844) |

#### Inputs

| Input | Datatype | Required | Description |
|---|---|---|---|
| `tcks` | `neuro/tcks` | yes | Directory of per-tract .tck files. Must contain at least one .tck file. |
| `t1` | `neuro/anat/t1w` | no | T1-weighted reference image (used first if present). |
| `t2` | `neuro/anat/t2w` | no | T2-weighted reference image (used if no T1w is given). |
| `mask` | `neuro/mask` | no | Mask used as reference image if no anatomical image is given. |
| `parc` | `neuro/parcellation/volume` | no | Parcellation used as reference image if no anatomical image is given. |

#### Outputs

| Output | Datatype | Description |
|---|---|---|
| `stat` | `neuro/tractmeasures` | Tract measures table (tractmeasures.csv) with one row per tract and DSI Studio and DIPY shape metrics. |

<!-- brainlife-app:end -->

## Running the App

### On brainlife.io

Open the App at [doi.org/10.25663/brainlife.app.844](https://doi.org/10.25663/brainlife.app.844), choose `neuro/tcks`, `neuro/anat/t1w`, `neuro/anat/t2w`, `neuro/mask`, `neuro/parcellation/volume` from your project and press **Execute**. The results are saved to your project as `neuro/tractmeasures`.

### Locally

You need [Singularity/Apptainer](https://apptainer.org/) (the App runs in `brainlife/dipy:1.4.1`), [`jq`](https://jqlang.github.io/jq/).

1. Clone this repository.
2. Create `config.json` with the paths to your inputs and the parameters:

   ```json
   {
       "tcks": "/path/to/tcks/tcks",
       "tcks_json": "/path/to/tcks/tcks_json",
       "t1": "/path/to/t1/t1",
       "t2": "/path/to/t2/t2",
       "mask": "/path/to/mask/mask",
       "parc": "/path/to/parc/parc",
       "key": "/path/to/parc/key",
       "label": "/path/to/parc/label"
   }
   ```

3. Run `./main`.

## Troubleshooting

- **Error: no .tck files found in directory**: Provide a tcks dataset containing .tck files.

## Citing

If you use this App, please cite it, the software it builds on and brainlife.io:

- Tract Shape Analysis. brainlife.io App. [doi:10.25663/brainlife.app.844](https://doi.org/10.25663/brainlife.app.844)
- **DSI Studio**: Yeh, F.-C. (2020). Shape analysis of the human association pathways. *Neuroimage, 223*, 117329. [DOI: 10.1016/j.neuroimage.2020.117329](https://doi.org/10.1016/j.neuroimage.2020.117329)
- **DIPY**: Garyfallidis, E., et al. (2014). DIPY, a library for the analysis of diffusion MRI data. *Frontiers in Neuroinformatics, 8*, 8. [DOI: 10.3389/fninf.2014.00008](https://doi.org/10.3389/fninf.2014.00008)
- Hayashi S, Caron BA, Heinsfeld AS, et al. brainlife.io: a decentralized and open-source cloud platform to support neuroscience research. *Nature Methods* 21:809–813 (2024). [doi:10.1038/s41592-024-02237-2](https://doi.org/10.1038/s41592-024-02237-2)
- Avesani P, McPherson B, Hayashi S, et al. The open diffusion data derivatives, brain data upcycling via integrated publishing of derivatives and reproducible open cloud services. *Scientific Data* 6:69 (2019). [doi:10.1038/s41597-019-0073-y](https://doi.org/10.1038/s41597-019-0073-y)

## Authors

**Gabriele Amorosino**  
*Email*:  

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
