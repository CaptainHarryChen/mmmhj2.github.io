clear;
hold off;
% ��Ĳ����Ͳ������Լ����߿��
lambda = 632e-9;
sigma = 1 / lambda;
delta_sigma = sigma / 10;

% ��������
a = 0.05;   % ���׼��
D = 1;      % �׵������ľ���

% ������λ��
delta_x = 30 * lambda * D / a;          % ���ƶ�ʮ������
x = linspace(-delta_x, delta_x, 8000);
delta = a .* x ./ D;

%plot(1 + cos(2 .* pi ./ lambda .* delta))

% ����������
SIN = pi .* delta_sigma .* delta;
SINC = sin(SIN) ./ SIN;
intensity = SINC .* cos(2 .* pi .* sigma .* delta);

subplot(2,1,1);
plot(intensity);
hold on;
plot(SINC, 'r--');
plot(-SINC, 'r--');

subplot(2,1,2);
image(x, delta_x, (intensity+1) .* 50);
colormap(gray)
