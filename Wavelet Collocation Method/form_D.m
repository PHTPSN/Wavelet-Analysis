function rt = form_D(phix, order)
    % phix is the vector of phi_1 to phi_{D-2} wrt. certain x

    rt = zeros(order);
    for i = 1:length(phix)
        rt = rt + diag(ones(order-i+1,1)*phix(i), -(i-1));
    end
    for i = 1:length(phix)-1
        rt = rt + diag(ones(i,1)*phix(i+1), order-i);
    end
end