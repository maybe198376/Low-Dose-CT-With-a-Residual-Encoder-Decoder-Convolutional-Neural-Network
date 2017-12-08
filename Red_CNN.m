clear all;
caffe.reset_all();
% MODEL
model = ['Red_CNN.prototxt'];
weights ='Red_CNN.caffemodel';
%Init Net
net = caffe.Net(model,weights,'test');
pfile = ['L506_QD_3_1.CT.0003.0035.2015.12.22.20.45.42.541197.358791561.IMA'];
X = dicomread(pfile);
im_input=double(X)/3000;
input_data = {im_input};
out_data = net.forward(input_data);
im_output = cell2mat(out_data);
subplot(1,2,1);
imshow(im_input,[850/3000 1250/3000]);
subplot(1,2,2);
imshow(im_output,[850/3000 1250/3000]);