clear all;close all;clc;
%addpath('K:\Dr Chows Old BRISQUE and SSIM and Rician work\Dr Chow');
%addpath('K:\Work for Paper 3\BRISQUE ORIGINAL ORIGINAL\BRISQUE_release\BRISQUE_release\Mat images from evaluation 2-hesha');
%addpath('C:\Users\Hesha\Documents\metrix_mux_latest\metrix_mux\metrix');
clear all;close all;clc;
%addpath('K:\Work for Paper 3\metrix_mux_latest\metrix_mux\metrix');
addpath('E:\Work for Paper 3\metrix_mux_latest\metrix_mux\metrix\Testing MRIs\Testing Osirix Brain');
% [filename,path] = uigetfile('*.*', 'Select Image','K:\Dr Chows Old BRISQUE and SSIM and Rician work\Dr Chow\');
% pathname = [path, filename];
% test_im = dicomread(pathname);

% prompt = {'Ref Image No:','RC Image:','GWN Image:','GB Image:','DCT Image:','JPEG Image:','JP2K Image:'};
% dlg_title = 'Input';
% num_lines = 1;
% def = {'1','6','11','16','21','26','31',};
% answer = inputdlg(prompt,dlg_title,num_lines,def);
% z1= str2num(answer{1});
% z2= str2num(answer{2});
% z3= str2num(answer{3});
% z4= str2num(answer{4});
% z5= str2num(answer{5});
% z6= str2num(answer{6});
% z7= str2num(answer{7});
z = 63;
load([num2str(z) '.mat'],'Ref_im');
p = size(Ref_im);
h = p(1);
w = p(2);
figure,imagesc(Ref_im);title({['MRI :  ',num2str(z)]}), %title({['Original MRI :  ',num2str(filename)]}), 
colormap('gray'), axis image,hold on;
imdist = Ref_im;
Image_Quality_ref = mri_quality_new(imdist);

%rmpath('K:\Work for Paper 3\metrix_mux_latest\metrix_mux\metrix');
rmpath('K:\Work for Paper 3\metrix_mux_latest\metrix_mux\metrix\Testing MRIs\Testing Osirix Brain');