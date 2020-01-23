%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Cleaning
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all, close all, home

%Loading in a signal and applying various signal 
%operations to it and then graphing the results to 
%better model the impact of these operations
x=imread('circles.png');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Original
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%System Input
h_orig=zeros(3,3);
h_orig(2,2)=1;

%Output
y_orig=imfilter(x,h_orig);

figure
subplot(121)
imshow(x);
title('x[n,m]');
subplot(122)
imshow(y_orig);
title('y_o_r_i_g[n,m]');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%LPF
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%System Input
h_lpf=(1/9).*ones(3,3);

%Output
y_lpf=imfilter(x,h_lpf);

figure
subplot(221)
imshow(x)
title('x[n,m]');
subplot(222)
imshow(y_lpf);
title('y_l_p_f[n,m]');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%HPF
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%System Input
h_hpf=zeros(3,3);
h_hpf(1,2)=-1;
h_hpf(2,1)=-1;
h_hpf(2,2)=4;
h_hpf(2,3)=-1;
h_hpf(3,2)=-1;

%Output
y_hpf=imfilter(x,h_hpf);

subplot(223)
imshow(x)
title('x[n,m]');
subplot(224)
imshow(y_hpf);
title('y_h_p_f[n,m]');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%LPF (Weighted Average)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%System Input
h_wlpf=(1/16).*ones(3,3);
h_wlpf(1,2)=2;
h_wlpf(2,1)=2;
h_wlpf(2,2)=4;
h_wlpf(2,3)=2;
h_wlpf(3,2)=2;

%Output
y_wlpf=imfilter(x,h_wlpf);

figure
subplot(221)
imshow(x)
title('x[n,m]');
subplot(222)
imshow(y_wlpf);
title('y_l_p_f[n,m] (Weighted Average)');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%HPF (Weighted Average)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%System Input
h_whpf=(1/9).*-ones(3,3);
h_whpf(2,2)=8;


%Output
y_whpf=imfilter(x,h_whpf);

subplot(223)
imshow(x)
title('x[n,m]');
subplot(224)
imshow(y_whpf);
title('y_h_p_f[n,m] (Weighted Average)');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Edge
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Inputs
a=imread('coins.png');
b=imread('coloredChips.png');
c=imread('circlesBrightDark.png');

%System Input
h_edge=-ones(3,3);
h_edge(2,2)=8;

%Output
y_cedge=imfilter(a,h_edge);   %Coins
y_ccedge=imfilter(b,h_edge);  %Colored Chips
y_cbdedge=imfilter(c,h_edge); %Circles Bright Dark

figure
subplot(321)
imshow(a)
title('a[n,m] (Coins Image)');
subplot(322)
imshow(y_cedge);
title('y_e_d_g_e[n,m] (Coins Image)');
subplot(323)
imshow(b)
title('b[n,m] (Colored Chips Image)');
subplot(324)
imshow(y_ccedge);
title('y_e_d_g_e[n,m] (Colored Chips Image)');
subplot(325)
imshow(c)
title('c[n,m] (Circles Bright Dark Image)');
subplot(326)
imshow(y_cbdedge);
title('y_e_d_g_e[n,m] (Circles Bright Dark Image)');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Sharpen
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Inputs
d=imread('spine.tif');

%System Input
h_sOne=-ones(3,3);
h_sOne(2,2)=9;
h_sTwo=-ones(3,3);
h_sTwo(2,2)=11;
h_sThree=-ones(3,3);
h_sThree(2,2)=13;

%Output
y_sOne=imfilter(d,h_sOne);     %Kernel 1
y_sTwo=imfilter(d,h_sTwo);     %Kernel 2
y_sThree=imfilter(d,h_sThree); %Kernel 3

figure
subplot(221)
imshow(d)
title('d[n,m] (Spine Image)');
subplot(222)
imshow(y_sOne);
title('y_s_h_a_r_p[n,m] (Kernel 1)');
subplot(223)
imshow(y_sTwo)
title('y_s_h_a_r_p[n,m] (Kernel 2)');
subplot(224)
imshow(y_sThree);
title('y_s_h_a_r_p[n,m] (Kernel 3)');
