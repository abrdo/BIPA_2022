function H = laws_kernel(k)
    if (k<1) || (k>9)
        error('input should be between 1 and 9');
    end
    L = 1/6*[1;2;1];
    E = 1/2*[1;0;-1];
    S = 1/2*[1;-2;1];
    
    H1 = L*transpose(L);
    H2 = L*transpose(E);
    H3 = L*transpose(S);
    H4 = E*transpose(L);
    H5 = E*transpose(E);
    H6 = E*transpose(S);
    H7 = S*transpose(L);
    H8 = S*transpose(E);
    H9 = S*transpose(S);
    Kernels = cat(3, H1, H2, H3, H4, H5, H6, H7, H8, H9);
    H = squeeze(Kernels(:,:,k));
    
end
