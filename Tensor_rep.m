%=== File: Tensor_rep.m ===
function [X1,X2,X3] = Tensor_rep(D)
    % TENSOR_REP unfolding for 3-mode tensor from vectorized frames
    [d, t] = size(D);
    d1 = 12; d2 = 16;  % adjust to your data
    A = reshape(D, [d1, d2, t]);
    B = imresize3(A, [d1, d2, 90]);
    % mode-1: unfold into d1 x (d2*frames)
    X1 = reshape(permute(B, [1,2,3]), d1, []);
    % mode-2: unfold into d2 x (d1*frames)
    X2 = reshape(permute(B, [2,1,3]), d2, []);
    % mode-3: unfold into frames x (d1*d2)
    X3 = reshape(permute(B, [3,1,2]), size(B,3), []);
end