clear;clc;
shot = 6516;

kin = load('/home/darkest/WorkDir/GitHub/quickfit/HL3/OUTPUT/kin_data_6516-Ti.mat');
load('/home/darkest/WorkDir/GitHub/quickfit/HL3/OUTPUT/raw_data_6516-Ti.mat')
time = data.coords.time.data;
chl = 1:32;

rho = data.data_vars.rho.data;
Ti = data.data_vars.Ti.data;
Ti_err = data.data_vars.Ti_err.data;
diags = data.data_vars.diags.data;
%%
figure('Units', 'centimeters', 'Position', [55 0 20 15]);
hold on;
grid on;

% ta = [850:50:1050];
% ta = [650:50:850];
ta = [350 500 800 950 1300];
num = length(ta);
colors = distinguishable_colors(num);

for ii = 1:num
    i = no(time,ta(ii)./1e3);
    % plot(rho(13,:),Ti(13,:),'-o',LineWidth=2);
    shadedErrorBar(kin.rho,kin.data(i,:),[kin.unc_low(i,:);kin.unc_low(i,:)]-kin.data(i,:),'lineProps',{'Color',colors(ii,:),'DisplayName',[num2str(time(i)*1000,"%04.1f"),' ms-fit'],'LineWidth',2})
%     errorbar(rho(i,:),Ti(i,:),Ti_err(i,:),'-o',LineWidth=2,DisplayName=[num2str(time(i)*1000,"%04.1f"),' ms'],Color=colors(ii,:));
    % plot(kin.rho,kin.data(i,:),'-o',LineWidth=2)

end
box on;
grid on;
xlabel('$\rho_{\rm pol}$', 'Interpreter', 'latex','fontname', 'Times New Roman', 'fontsize', 18);
ylabel('$T_{\rm i}\ {\rm (eV)}$', 'Interpreter', 'latex','fontname', 'Times New Roman', 'fontsize', 18);
title(['HL-3:#', num2str(shot)]);

%%
clear;clc;
shot = 6521;

kin = load('/home/darkest/WorkDir/GitHub/quickfit/HL3/OUTPUT/kin_data_6521.mat');
load('/home/darkest/WorkDir/GitHub/quickfit/HL3/OUTPUT/raw_data_6521.mat')
% time = data.coords.time.data;
% chl = 1:32;

ta = [350 380 400 440];
num = length(ta);
colors = distinguishable_colors(num);


time = kin.ne.tvec;
x = kin.ne.rho;
y = kin.ne.data;
y_u = kin.ne.unc_up-y;
y_l = y-kin.ne.unc_low;

figure('Units', 'centimeters', 'Position', [55 20 20 15]);
hold on;
grid on;
for ii = 1:num
    i = no(time,ta(ii)./1e3);
    shadedErrorBar(x,y(i,:),[y_u(i,:);y_l(i,:)],'lineProps',{'Color',colors(ii,:),'DisplayName',[num2str(time(i)*1000,"%04.1f"),' ms-fit'],'LineWidth',2})
end
box on;
grid on;
legend;
xlabel('$\rho_{\rm pol}$', 'Interpreter', 'latex','fontname', 'Times New Roman', 'fontsize', 18);
ylabel('$n_{\rm e}\ {\rm (m^{-3})}$', 'Interpreter', 'latex','fontname', 'Times New Roman', 'fontsize', 18);
title(['HL-3:#', num2str(shot)]);

time = kin.Te.tvec;
x = kin.Te.rho;
y = kin.Te.data;
y_u = kin.Te.unc_up-y;
y_l = y-kin.Te.unc_low;
figure('Units', 'centimeters', 'Position', [55 0 20 15]);
hold on;
grid on;
for ii = 1:num
    i = no(time,ta(ii)./1e3);
    shadedErrorBar(x,y(i,:),[y_u(i,:);y_l(i,:)],'lineProps',{'Color',colors(ii,:),'DisplayName',[num2str(time(i)*1000,"%04.1f"),' ms-fit'],'LineWidth',2})
end
box on;
grid on;
legend;
xlabel('$\rho_{\rm pol}$', 'Interpreter', 'latex','fontname', 'Times New Roman', 'fontsize', 18);
ylabel('$T_{\rm e}\ {\rm (eV)}$', 'Interpreter', 'latex','fontname', 'Times New Roman', 'fontsize', 18);
title(['HL-3:#', num2str(shot)]);

time = kin.Ti.tvec;
x = kin.Ti.rho;
y = kin.Ti.data;
y_u = kin.Ti.unc_up-y;
y_l = y-kin.Ti.unc_low;
figure('Units', 'centimeters', 'Position', [55 -20 20 15]);
hold on;
grid on;
for ii = 1:num
    i = no(time,ta(ii)./1e3);
    shadedErrorBar(x,y(i,:),[y_u(i,:);y_l(i,:)],'lineProps',{'Color',colors(ii,:),'DisplayName',[num2str(time(i)*1000,"%04.1f"),' ms-fit'],'LineWidth',2})
end
box on;
grid on;
legend;
xlabel('$\rho_{\rm pol}$', 'Interpreter', 'latex','fontname', 'Times New Roman', 'fontsize', 18);
ylabel('$T_{\rm i}\ {\rm (eV)}$', 'Interpreter', 'latex','fontname', 'Times New Roman', 'fontsize', 18);
title(['HL-3:#', num2str(shot)]);