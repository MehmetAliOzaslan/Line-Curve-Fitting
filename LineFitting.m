function output = LineFitting(xi,yi)
% xi: x axis values
% yi: y axis values
n = length(xi);
a1 = (n*sum(xi.*yi) - sum(xi).*sum(yi))./(n*sum(xi.^2) - sum(xi).^2);
a0 = (1/n)*(sum(yi) - a1*(sum(xi)));
fprintf('%s %f\n','Estimated Value a1: ', a1)
fprintf('%s %f\n','Estimated Value a0: ', a0)
plot(xi,yi, 'ro' ,'MarkerSize',3, 'LineWidth', 3, 'MarkerFaceColor', 'r');hold on;
x = 0:0.1:(n+1);
y = a0 + a1*x;
plot(x,y);grid minor

Sr = sum((yi - (a0 + a1*xi)).^2);
Syx = sqrt(Sr/(n-2));
fprintf('%s %f\n','Estimated Standard Error: ', Syx)

abovey = sum(yi)/n;
St = sum((yi-abovey).^2);

Sy = sqrt(St/(n-1));
fprintf('%s %f\n','Estimated Standard Deviation: ', Sy)

rsquare = (St - Sr)/St;
output = rsquare;
fprintf('%s %f\n','Estimated Stability Coefficient: ', output)
end