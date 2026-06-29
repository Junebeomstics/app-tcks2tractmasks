
# tcks2tractmasks

`tcks2tractmasks` is a pipeline for converting tractography streamline files (`.tck`) into binary NIfTI tract masks (`.nii.gz`). For each input tract, the pipeline upsamples the streamlines, computes a density map, and saves a binary volumetric mask that can be used for downstream ROI or overlap analyses.

---

## Author

**Junbeom Kwon**

---

## Usage

### Running on Brainlife.io

You can run the `tcks2tractmasks` app on the [Brainlife.io platform](https://brainlife.io) via the web user interface (UI) or using the Brainlife CLI. This platform manages inputs and outputs and executes computations on its cloud resources.

#### On Brainlife.io via UI

1. Navigate to the Brainlife.io platform and locate the `app-tcks2tractmasks` app.
2. Click the **Execute** tab.
3. Upload the required input files:
   - A folder containing `.tck` files, encoded in BrainLife as `tcks` datatype.
   - A reference image (e.g., FA map or brain mask) with the same affine as the DWI data, encoded as `fa` datatype.
4. Submit the job and download or visualize the results after computation completes.

#### On Brainlife.io using CLI

1. Install the Brainlife CLI by following the instructions [here](https://brainlife.io/docs/cli/install/).
2. Log in to the Brainlife CLI:
   ```bash
   bl login
   ```
3. Execute the app with the following command:
   ```bash
   bl app run --id <app_id> --project <project_id> --input tcks:<tcks_id> --input fa:<fa_id>
   ```
   Replace `<app_id>`, `<project_id>`, and input IDs with the appropriate values. The output will be saved in the specified project.

---

### Running Locally

You can also run the pipeline locally by preparing a configuration file and executing the main script.

#### Steps:

1. Clone the repository:
   ```bash
   git clone https://github.com/junbeomkwon/app-tcks2tractmasks.git
   cd app-tcks2tractmasks
   ```

2. Prepare a `config.json` file to specify input paths. Example:
   ```json
   {
       "tcks": "/path/to/tcks",
       "fa": "/path/to/fa.nii.gz"
   }
   ```

3. Execute the script:
   ```bash
   ./main
   ```

---

## Outputs

Binary tract masks are saved in the `masks/masks/` directory, one `.nii.gz` file per input `.tck` file. Each mask is a binary NIfTI volume where voxels traversed by at least one streamline are set to 1.

---

## Pipeline Overview

| Step | Script | Description |
|------|--------|-------------|
| 1 | `main` | Reads `config.json`, sets up output directory, launches Singularity container |
| 2 | `scripts/convert_trk_to_nii.sh` | Iterates over all `.tck` files in the input folder |
| 3 | `scripts/trk_2_binary.py` | Upsamples streamlines, computes density map, saves binary mask |

---

## Requirements

- Singularity

---

## Citation

If you use this repository in your research, please cite the following:

- **DIPY**:  
  Garyfallidis, E., et al. (2014). DIPY, a library for the analysis of diffusion MRI data.  
  *Frontiers in Neuroinformatics, 8*, 8.  
  [DOI: 10.3389/fninf.2014.00008](https://doi.org/10.3389/fninf.2014.00008)

- **Brainlife.io**:  
  Hayashi, S., et al. (2024). brainlife.io: a decentralized and open-source cloud platform to support neuroscience research.  
  *Nature Methods, 21*(5), 809-813.  
  [DOI: 10.1038/s41592-024-02237-2](https://doi.org/10.1038/s41592-024-02237-2)

---

## Acknowledgments

This app was developed based on the original `app-tcks2tractmeasures` pipeline by **Gabriele Amorosino** (gabriele.amorosino@utexas.edu).
