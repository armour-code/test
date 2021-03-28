
%基于sobel与除法的光照算法
clc,clear;
cd('C:\Users\94331\Desktop\小论文\图像库');
img_origin = imread('img1.bmp'); %读取图像文件
img_origin= rgb2gray(img_origin); %将真彩色图像转换为灰度图像二维矩阵

img_size = size( img_origin ); % 返回矩阵的行数或列数 其中r=size(A,1)该语句返回矩阵A的行数row为垂直方向
img_origin= double(img_origin);
img_origin1=double(zeros(img_size(1) ,img_size(2)));
img_origin2=double(zeros(img_size(1) ,img_size(2)));
img_origin3=double(zeros(img_size(1) ,img_size(2)));
img_origin4=uint8(zeros(img_size(1) ,img_size(2)));
img_origin5=uint8(zeros(img_size(1) ,img_size(2)));
tic
%soble除法
for  mmn=1:5000
for  i=2:img_size(1)-1
    for j=2:img_size(2)-1
        img_origin1(i,j)=img_origin(i+1,j-1)+ img_origin(i+1,j+1)+2*img_origin(i+1,j)- img_origin(i-1,j+1)- 2*img_origin(i-1,j)-img_origin(i-1,j-1);
        img_origin2(i,j)=img_origin(i-1,j+1)+ img_origin(i+1,j+1)+2*img_origin(i,j+1)- img_origin(i+1,j-1)-img_origin(i-1,j-1)- 2*img_origin(i,j-1);
        img_origin3(i,j)=1.0*(abs( img_origin1(i,j))+abs( img_origin2(i,j)))/img_origin(i,j);
        
        if img_origin3(i,j)>2.5
             img_origin3(i,j)=255;
        else
            img_origin3(i,j)=0;
        end
    end
end
%一般二值化
for  i=2:img_size(1)-1
    for j=2:img_size(2)-1
        
        if img_origin(i,j)>120
            img_origin4(i,j)=255;
        else
            img_origin4(i,j)=0;
        end
    end
end
img_origin4=uint8(img_origin4);
%subplot(2,2,3);imshow(img_origin4);%title('二值化');
%相结合
for  i=2:img_size(1)-1
    for j=2:img_size(2)-1
        
        if img_origin3(i,j)==255
            img_origin4(i,j)=0;
        end
    end
end
end
toc

img_origin= uint8(img_origin);
subplot(2,2,1);imshow(img_origin);%title('原图');
 subplot(2,2,2);imshow(img_origin3);%title('sobel-除法');
subplot(2,2,4);imshow(img_origin4);%title('最终效果');

        