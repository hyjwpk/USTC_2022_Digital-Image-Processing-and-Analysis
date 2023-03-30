source = imread('cameraman.bmp');
subplot(1,3,1); imshow(source); title('原图'); 
range_value = .35;
S = qtdecomp(source,range_value,2);%四叉树分割
blocks = zeros(256);

%产生分块边界
for dim = [64 32 16 8 4 2]
	numblocks = length(find(S==dim));    
	if (numblocks > 0)        
        values = repmat(uint8(1),[dim dim numblocks]);
        values(2:dim,2:dim,:) = 0;
        blocks = qtsetblk(blocks,S,dim,values);
  end
end

%产生分裂图
output1 = source;
output1(blocks==1) = 255;
subplot(1,3,2); imshow(output1); title('分裂'); 

%将各块分别标记
i = 0;
for dim = [64 32 16 8 4 2]
    [vals,r,c] = qtgetblk(source,S,dim);
    if ~isempty(vals)
        for j = 1:length(r)
            i = i + 1;
            blocks(r(j):r(j)+ dim - 1,c(j):c(j)+ dim - 1) = i;
        end
    end
end

%将极差较小的块的标记合并
for j = 1 : i
    bound = boundarymask(blocks==j,4) & (~(blocks==j));
    [r,l] = find(bound==1);
    for k = 1 : size(r,1)
        merge = source((blocks==j) | (blocks==blocks(r(k),l(k))));
        if(range(merge(:))<range_value*256)
            blocks(blocks==blocks(r(k),l(k))) = j;
        end
    end
end

%根据标记重新分割
output2 = source;
for i = 2 : 255
    for j = 2 : 255
        if(blocks(i,j)~=blocks(i,j+1) || blocks(i,j)~=blocks(i+1,j))
            output2(i,j) = 255;
        end
    end
end

subplot(1,3,3); imshow(output2); title('合并'); 