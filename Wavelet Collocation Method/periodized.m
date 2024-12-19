function [phi_periodized, x_periodized] = periodized(phi, N, iter, j)
    % periodized to [0,1], we guarantee j <= iter
    n = 2^iter;
    D = 2*N;
    if length(phi) ~= n*(D-1)+1
        error("Vector lengths do not match.")
    end
    if -j > iter
        error("The scaling scale should be less than the numerial dyadic accuracy.")
    end

    if j > 0
        phi = [phi(1:end-1), zeros(1, (2^j-1)*(length(phi)-1))];  % extension
    end
    n_step = 2^(iter + j);
    phi_periodized = zeros(1, n_step);

    if j < 0
        maxi = (D-1)/2^j;
    else
        maxi = D-1;
    for i = 1:maxi
        phi_periodized = phi_periodized + phi(((i-1)*n_step+1):i*n_step);
    end
    phi_periodized = [phi_periodized, phi_periodized(1)]*2^(j/2);
    
    x_periodized = linspace(0,1,n_step+1);
end