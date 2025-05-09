%=== File: classify_nModeGDS.m ===
function conf = classify_nModeGDS(Data, U, W, ri, k, weights)
    % CLASSIFY_NMODEGDS apply weighted canonical-sum classification
    nclass = numel(Data);
    N = numel(ri);
    conf = zeros(nclass);
    for i = 1:nclass
        X = Data{i}{2};  % test sample
        [T1,T2,T3] = Tensor_rep(X);
        testModes = {T1,T2,T3};
        for j = 1:nclass
            score = 0;
            for m = 1:N
                Uraw = EVD(testModes{m});
                Uraw = Uraw(:,1:ri(m));
                Utest = W{m}' * Uraw;
                Vproj = W{m}' * U{m,j};
                score = score + weights(m)*canonicalSum(Utest, Vproj, k(m));
            end
            conf(i,j) = score;
        end
    end
end