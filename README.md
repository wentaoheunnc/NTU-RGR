# NTU-RGR

This repository contains codes for data generation about our paper in the Pattern Recognition journal: 

[**Radar gait recognition using Dual-branch Swin Transformer with Asymmetric Attention Fusion**](https://doi.org/10.1016/j.patcog.2024.111101)  
[Wentao He](https://wentaoheunnc.github.io/), [Jianfeng Ren](https://research.nottingham.edu.cn/en/persons/jianfeng-ren), [Ruibin Bai](http://www.cs.nott.ac.uk/~znzbrbb/), [Xudong Jiang](https://personal.ntu.edu.sg/exdjiang/default.htm)  
*Pattern Recognition*, 2025. 

## Usage

### Generate spectrograms and CVDs using this repository

**Step 1**: Create file directories `./dataset` and `./DataMatrix`. 

**Step 2**: Download the raw signal files (~14GB) from [Google Drive]() and save data to `./dataset`. 

**Step 3**: Run `generate_spectrogram_for_all.m` to convert raw gait signals into spectrograms in `.mat` format. 

**Step 4**: Generate a data partition sequence to split train and test subsets with different settings. 
* Run `generate_half_partition.m`: For each subject with $N$ sequences ($N=10$ or $20$), sequences $[1:N/2]$ will be used for training and sequences $[N/2:N]$ will be used for testing.
* Run `generate_random_partition.m`: For each subject with $N$ sequences ($N=10$ or $20$), randomly selected $N/2$ sequences will be used for training and the remaining will be used for testing.
* Run `generate_second_partition.m`: The train and test subsets will be partitioned based on Collecting Phase I/II for Protocol II evaluation. Please refer to the original paper for more details.  

**Step 5**: Run `mat2pngSpec.m` or `mat2pngCVD.m` to generate spectrogram/CVD patches with size of $115\times115$. You may need to mannually load sequences you get from **Step 3** by modifying Line 6.

### Download the full dataset from online disks

Alternatively, we upload the image files of generated spectrograms/CVDs to [Google Drive](https://drive.google.com/drive/folders/15ymhX6rjhHcUlJul6Ecb78pjxTrMQ13K?usp=sharing). You may use the image dataset with customized train/test partitions.

## Citation
We thank you for showing interest in our work. 
If you find the paper and/or the code helpful, please consider citing us using:

```
@article{he2025radar,
  title={Radar gait recognition using Dual-branch Swin Transformer with Asymmetric Attention Fusion},
  author={He, Wentao and Ren, Jianfeng and Bai, Ruibin and Jiang, Xudong},
  journal={Pattern Recognition},
  volume={159},
  pages={111101},
  year={2025}
}
```

```
@inproceedings{chen2022attention,
  title={Attention-based dual-stream vision transformer for radar gait recognition},
  author={Chen, Shiliang and He, Wentao and Ren, Jianfeng and Jiang, Xudong},
  booktitle={Proceedings of the IEEE International Conference on Acoustics, Speech and Signal Processing (ICASSP)},
  pages={3668--3672},
  year={2022}
}
```

## Acknowledgement

We'd like to express our sincere gratitude towards all the advisors and anonymous reviewers for helping us improve the paper. We'd like to thank authors for all the pioneer works in this research field. 
