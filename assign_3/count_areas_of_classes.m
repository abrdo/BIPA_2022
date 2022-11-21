function areas_in_pxls = count_areas_of_classes(CLASSMAP, n_classes)
    % n_classes: number of classes of the interest
    areas_in_pxls = zeros(n_classes, 1);
    for i = 1:n_classes
        tmp = CLASSMAP == i;
        areas_in_pxls(i) = sum(sum(tmp));
    end
end

