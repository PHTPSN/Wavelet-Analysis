function rt = form_differentiation_matrix(phi, n)
    idx = 1:n:(size(phi,2)-1);
    rt = phi(:,idx);
end