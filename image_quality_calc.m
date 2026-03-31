% Test random MRI images
%clear all;close all;clc;
%addpath('K:\Work for Paper 3\DR CHOW 15 database images');

% load 1G1C
% load 1G1W

promptA = {'Choose first image number','Choose last image number (max 6 images only)'};
defA = {'7','12'};
answerA = inputdlg(promptA, 'MRI QUALITY SCORING', 1, defA);

if not(isempty(answerA))
    
    imagNo1 = eval(answerA{1});        % index for image
    imagNo2 = eval(answerA{2}); 

    figure('Position', rect1), set(gcf,'Color',[1,1,1]);
    a = 0;
    for k = imagNo1:imagNo2
        a = a + 1;
        % Convert into unsigned 8-bit (1-byte) integers of class uint8.
        imageBriC = uint8(squeeze(cropI(k,:,:)));       % cropped image
        imageBriW = uint8(squeeze(imageW(k,:,:)));      % whole image
        
        disp('  ');
        disp(strcat('Image',num2str(k),':'));
        
%         Modified_BRISQUE_Crop(a,1) = mri_quality_new(imageBriC)      % cropped image
%         Modified_BRSIQUE_Whole (a,1)= mri_quality_new(imageBriW)      % whole image
        
%         BRISQUE_Crop(a,1) = brisquescore(imageBriC)      % cropped image
%         BRSIQUE_Whole (a,1) = brisquescore(imageBriW)      % whole image
        
       figure, imagesc(squeeze(imageW(14,:,:))),title(strcat(num2str(k),'-',name(14,:))), axis image, colormap(gray), colorbar('vert'),impixelinfo;
        
    end
end







% % Image_Quality_ref = mri_quality_new(imdist1);
% % figure,imagesc(imdist1);title({['MRI Quality :  ',num2str(Image_Quality_ref)]}), %title({['Original MRI :  ',num2str(filename)]}), 
% % colormap('gray'), axis image,hold on;
% % 
% % load 1G1W
% % imdist2 = imageW;
% % Image_Quality_ref = mri_quality_new(imdist2);
% % figure,imagesc(imdist2);title({['MRI Quality :  ',num2str(Image_Quality_ref)]}), %title({['Original MRI :  ',num2str(filename)]}), 
% % colormap('gray'), axis image,hold on;

%rmpath('K:\Work for Paper 3\DR CHOW 15 database images');