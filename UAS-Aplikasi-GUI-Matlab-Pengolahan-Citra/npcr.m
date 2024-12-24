function nilai_npcr = npcr(Img, Img_comp)
    % Validasi ukuran gambar
    if ~isequal(size(Img), size(Img_comp))
        error('Ukuran gambar tidak sama. Pastikan kedua gambar memiliki dimensi yang sama.');
    end

    % Hitung NPCR
    [M, N] = size(Img); % Ukuran gambar
    D = Img ~= Img_comp; % Matriks perbedaan piksel
    nilai_npcr = sum(D(:)) / (M * N) * 100; % Persentase perubahan piksel
end
