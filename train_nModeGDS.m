%=== File: train_nModeGDS.m ===
function [U, W] = train_nModeGDS(Data, ri, rd)
    % TRAIN_NMODEGDS compute per-mode class bases and GDS projections
    nclass = numel(Data);
    N = numel(ri);
    U = cell(N, nclass);
    % Compute class bases
    for c = 1:nclass
        X = Data{c}{1};  % example sample
        [X1,X2,X3] = Tensor_rep(X);
        modes = {X1,X2,X3};
        for m = 1:N
            [V, ~] = EVD(modes{m});
            U{m,c} = V(:,1:ri(m));
        end
    end
    % Compute GDS projection per mode
    W = cell(1, N);
    for m = 1:N
        bases = U(m, :);
        W{m} = GDS_classic(bases, rd(m));
    end
end
