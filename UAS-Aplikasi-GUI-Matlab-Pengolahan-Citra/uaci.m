function nilai_uaci = uaci(Img, Img_comp)
    % Validasi ukuran gambar
    if ~isequal(size(Img), size(Img_comp))
        error('Ukuran gambar tidak sama. Pastikan kedua gambar memiliki dimensi yang sama.');
    end

    % Hitung UACI
    Img = double(Img);
    Img_comp = double(Img_comp);
    diff = abs(Img - Img_comp);
    nilai_uaci = (sum(diff(:)) / (numel(Img) * 255)) * 100; % Dalam persen
end
