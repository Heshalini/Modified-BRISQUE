function Image_Quality = mri_quality_new(imdist)
%% For new image testing

%clear all;close all;clc;
%addpath('K:\Dr Chows Old BRISQUE and SSIM and Rician work\Dr Chow');
%addpath('K:\Work for Paper 3\BRISQUE ORIGINAL ORIGINAL\BRISQUE_release\BRISQUE_release\Mat images from evaluation 2-hesha');
%addpath('C:\Users\Hesha\Documents\metrix_mux_latest\metrix_mux\metrix');
%addpath('C:\Users\Hesha\Documents\metrix_mux_latest\metrix_mux\metrix\Testing MRIs');
% [filename,path] = uigetfile('*.*', 'Select Image','K:\Dr Chows Old BRISQUE and SSIM and Rician work\Dr Chow\');
% pathname = [path, filename];
% test_im = dicomread(pathname);

    
% load ([num2str(img) '.mat'])
% test_im = rc_im;
%test_im = double(test_im);

%test_im = (test_im/ max(test_im(:)))*255;



%imdist = test_im;


imdist = double(imdist);
% 
% if(nargin<2)
feat_test_mri = brisque_feature(imdist);
% disp('feat computed')
save feat_test_mri feat_test_mri

% Process calculated features
load MaxV_final_1
load MinV_final_1
%scaled_trial = scaleSVM_H(feat_test_mri,MaxV,MinV);

%Scale the trial data
[R C] = size(feat_test_mri);
scaled = (feat_test_mri-MinV)./(MaxV-MinV);
for i=1:size(feat_test_mri,2)
    if(all(isnan(scaled(:,i))))
        scaled(:,i)=0;
    end
end
trial_data=scaled;
save trial_data trial_data

load model_final_1

[y_trial, Acc_trial, projection_trial] = svmpredict(0,trial_data,model);
Image_Quality = y_trial;

% figure,imagesc(test_im); title({['Quality score :  ',num2str(Image_Quality)]}), 
% colormap('gray'), axis image,hold on;

%%Usage: [predicted_label, accuracy, decision_values/prob_estimates] = svmpredict(testing_label_vector, testing_instance_matrix, model, 'libsvm_options')
       %%%[predicted_label] = svmpredict(testing_label_vector, testing_instance_matrix, model, 'libsvm_options')

%rmpath('K:\Dr Chows Old BRISQUE and SSIM and Rician work\Dr Chow')
%rmpath('K:\Work for Paper 3\BRISQUE ORIGINAL ORIGINAL\BRISQUE_release\BRISQUE_release\Mat images from evaluation 2-hesha');
%rmpath('C:\Users\Hesha\Documents\metrix_mux_latest\metrix_mux\metrix');
%rmpath('C:\Users\Hesha\Documents\metrix_mux_latest\metrix_mux\metrix\Testing MRIs');