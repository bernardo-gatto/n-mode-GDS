%=== File: nModeGDS_main.m ===
%% Entry script for n-mode GDS tensor classification
clear; close all;

% Load data
load('cambridge16x12.mat');  % Cell array Data{class}{sample}
nclass = numel(Data);

% Parameters
ri      = [7, 7, 16];   % retained dims for test subspaces (modes 1–3)
rd      = [5, 5, 14];   % dims for GDS projection per mode
k       = [5, 5,  9];   % number of canonical angles per mode
weights = [1, 2,  1];   % weights for each mode

% TRAIN: compute class bases and GDS projections
[U, W] = train_nModeGDS(Data, ri, rd);

% TEST: classify and visualize confusion
conf_total = classify_nModeGDS(Data, U, W, ri, k, weights);
figure; imagesc(conf_total); colorbar;
title('n-mode GDS classification matrix');