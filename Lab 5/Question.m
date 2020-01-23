%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Cleaning
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all, close all, home

%Loading in a signal and applying various signal 
%operations to it and then graphing the results to 
%better model the impact of these operations
x=imread('yellowlily.jpg');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Lighten 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%System Input
h_lOne=zeros(3,3);
h_lOne(1,1)=1;
h_lOne(2,2)=1;
h_lOne(3,3)=1;
h_lTwo=zeros(5,5);
h_lTwo(1,1)=1;
h_lTwo(2,2)=1;
h_lTwo(3,3)=1;
h_lTwo(4,4)=1;
h_lTwo(5,5)=1;
h_lThree=zeros(7,7);
h_lThree(1,1)=1;
h_lThree(2,2)=1;
h_lThree(3,3)=1;
h_lThree(4,4)=1;
h_lThree(5,5)=1;
h_lThree(6,6)=1;
h_lThree(7,7)=1;

%Output
y_lOne=imfilter(x,h_lOne);
y_lTwo=imfilter(x,h_lTwo);
y_lThree=imfilter(x,h_lThree);

figure
subplot(221)
imshow(x);
title('x[n,m]');
subplot(222)
imshow(y_lOne);
title('y_l_i_g_h_t[n,m] (Lighten 1)');
subplot(223)
imshow(y_lTwo);
title('y_l_i_g_h_t[n,m] (Lighten 2)');
subplot(224)
imshow(y_lThree);
title('y_l_i_g_h_t[n,m] (Lighten 3)');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Lighten 2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%System Input
h_llOne=ones(3,3);
h_llTwo=ones(5,5);
h_llThree=ones(7,7);

%Output
y_llOne=imfilter(x,h_llOne);
y_llTwo=imfilter(x,h_llTwo);
y_llThree=imfilter(x,h_llThree);

figure
subplot(221)
imshow(x);
title('x[n,m]');
subplot(222)
imshow(y_llOne);
title('y_l_i_g_h_t_2[n,m] (Lighten 1)');
subplot(223)
imshow(y_llTwo);
title('y_l_i_g_h_t_2[n,m] (Lighten 2)');
subplot(224)
imshow(y_llThree);
title('y_l_i_g_h_t_2[n,m] (Lighten 3)');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Emboss
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Inputs
a=imread('lighthouse.png');
b=imread('trailer.jpg');

%System Input
h_emb=ones(3,3);
h_emb(1,1)=-2;
h_emb(1,1)=-2;
h_emb(1,2)=-1;
h_emb(1,3)=0;
h_emb(2,1)=-1;
h_emb(3,1)=0;
h_emb(3,3)=2;

%Output
y_embl=imfilter(a,h_emb);
y_embt=imfilter(b,h_emb);

figure
subplot(221)
imshow(a);
title('a[n,m] (Lighthouse)');
subplot(222)
imshow(y_embl);
title('y_e_m_b[n,m] (Lighthouse Emboss)');
subplot(223)
imshow(b);
title('b[n,m] (Trailer)');
subplot(224)
imshow(y_embt);
title('y_e_m_b[n,m] (Trailer Emboss)');
