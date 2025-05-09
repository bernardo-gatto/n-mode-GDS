# Tensor Analysis with n-Mode Generalized Difference Subspace

This repository implements the n-mode Generalized Difference Subspace (GDS) method for tensor classification based on:

> **Gatto, B. B., dos Santos, E. M., Koerich, A. L., Fukui, K., & Júnior, W. S. S.** (2021). *Tensor analysis with n-mode generalized difference subspace*. *Expert Systems with Applications, 171*, 114559. [https://doi.org/10.1016/j.eswa.2020.114559](https://doi.org/10.1016/j.eswa.2020.114559)

## Overview

Multi-dimensional data (tensors) arise naturally in applications such as video analysis, hyperspectral imaging, and multi-sensor time series. Traditional subspace methods lack discriminative power when applied to tensor data. This project:

* Introduces an n-mode GDS projection to extract class-separating features per tensor mode.
* Embeds the resulting subspaces into a product Grassmann manifold for unified classification.
* Defines a reworked Fisher score for tensor separability and a weighted geodesic distance.

## Repository Structure

```plaintext
├── nModeGDS_main.m       % Entry script: training, testing, visualization
├── train_nModeGDS.m      % Computes class bases and per-mode GDS projections
├── classify_nModeGDS.m   % Classifies test samples via weighted canonical-sum
├── Tensor_rep.m          % Mode-wise tensor unfolding (3-mode example)
├── gds_utils.m           % EVD and canonical-sum utilities
└── LICENSE               % MIT License
```

## Requirements

* **MATLAB** R2019b or later
* **Image Processing Toolbox** (for `imresize3`)
* **Statistics and Machine Learning Toolbox** (for Fisher score, optional)

## Usage

1. **Clone the repository**

   ```bash
   ```

git clone [https://github.com/bernardo-gatto/nModeGDS.git](https://github.com/bernardo-gatto/nModeGDS.git)
cd nModeGDS

````
2. **Run classification**
```matlab
% Adjust parameters in nModeGDS_main.m if needed
nModeGDS_main;
````

3. **Inspect results**

   * A confusion matrix (`imagesc`) visualizes classification performance across classes.

## Citation

If you use this code, please cite:

```bibtex
@article{gatto2021tensor,
  title={Tensor analysis with n-mode generalized difference subspace},
  author={Gatto, Bernardo B and dos Santos, Eulanda M and Koerich, Alessandro L and Fukui, Kazuhiro and Junior, Waldir SS},
  journal={Expert Systems with Applications},
  volume={171},
  pages={114559},
  year={2021},
  publisher={Elsevier}
}
```

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
