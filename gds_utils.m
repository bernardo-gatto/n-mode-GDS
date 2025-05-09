%=== File: gds_utils.m ===
function [eig_vec, eig_val] = EVD(D)
    % EVD eigen-decomposition utility
    [d,n] = size(D);
    if d < n
        C = D*D';
        [V,L] = eig(C);
        [vals, idx] = sort(diag(L), 'descend');
        eig_vec = V(:, idx);
        eig_val = vals;
    else
        C = D'*D;
        [Vt,L] = eig(C);
        [vals, idx] = sort(diag(L), 'descend');
        eig_vec = D*Vt(:, idx) * diag(1./sqrt(vals));
        eig_val = vals;
    end
end

function s = canonicalSum(U, V, k)
    % CANONICALSUM sum of first k canonical-cosine values
    if size(U,1) >= size(V,1)
        S = U'*(V*V')*U;
    else
        S = V'*(U*U')*V;
    end
    angles = sort(eig(S), 'descend');
    s = sum(angles(1:k));
end
