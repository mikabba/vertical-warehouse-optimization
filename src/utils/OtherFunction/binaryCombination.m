function result = binaryCombination(bit)
max = bitshift(1,bit);

for i = 1:max+1
    A{i} = dec2bin(i-1);
end
for i = 1:max
    j = 1;
    for c = A{i}
        B(1,j) = str2num(c);
        j = j +1;
    end
    result(i,:) = [zeros(1,bit-numel(B)) B];
end

end