function color = generateRandomColor()
    letters = '0123456789ABCDEF';
    color = "#";
    for i = 0:5
        random = floor(rand(1) * 16);
        if random == 0
            random = 1;
        end
        color = color + letters(random);
    end
end