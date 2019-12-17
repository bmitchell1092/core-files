%% BMxsessionsPlot
% Designed to be compatible with workspace generated by BMxsessions.m


%% Plot: Timeplots 

refwin = -50:600;
figure('position',[213.6,149.6,724.6666,425.3334]);


clear c L
for L = 1:3
    subplot(2,3,L)
    plot(refwin,sAVG.DE.aMUA.pc.layers.data(2:4,:,L),'color','b')
    hold on
    plot(refwin,sAVG.BIN.aMUA.pc.layers.data(2:4,:,L),'color','r')
    %ylimit = max(abs(get(gcf,'ylim')));
    ylimit = 80;
    set(gca,'ylim',[-10 ylimit],'Box','off','TickDir','out')
    ylabel({'Percent change'...
    'from baseline'});
    xlabel('time (ms)');
    if L == 1
        title('Supragranular');
    elseif L == 2
            title('Granular');
        else 
            title('Infragranular');
    end
end

clear c L
for L = 1:3
    for c = 2:4
    subplot(2,3,L+3)
    plot(refwin,((smooth(sAVG.BIN.aMUA.pc.layers.data(c,:,L)))-(smooth(sAVG.DE.aMUA.pc.layers.data(c,:,L)))),'linewidth',.1);
    hold on
    %ylimit = max(abs(get(gcf,'ylim')));
    ylimit = 50;
    set(gca,'ylim',[-10 ylimit],'Box','off','TickDir','out')
    ylabel({'Percent change'...
    'from baseline'});
    xlabel('time (ms)');
    end
end

sgtitle({'V1 laminae contrast responses: monoptic (blue) vs dioptic (red) stimulation'},'Interpreter','none');

refwin = -50:600;
figure('position',[213.6,149.6,724.6666,425.3334]);




%% Bar Graphs: Conditions

rcontrast = round(tmp.STIM.levels,2,'significant');

figure('Position', [155,98,965,487]);

labels = {0, 22, 45, 90,[],0,22,45,90}; format bank;

clear L c
for L = 1:3
subplot(2,3,L)
bar([sAVG.BIN.aMUA.pc.coll_layers.data(:,2,L);NaN;sAVG.BIN.aMUA.pc.coll_layers.data(:,3,L)],1,'FaceColor',[0.8500, 0.3250, 0.0980],'EdgeColor','k','LineWidth',0.8);
hold on
%errorbar(AVG.BIN.layers.transient.data(:,i),AVG.BIN.layers.transient.error(:,i),'o','marker','none','color','k');
bar([sAVG.DE.aMUA.pc.coll_layers.data(:,2,L);NaN;sAVG.DE.aMUA.pc.coll_layers.data(:,3,L)],0.6,'FaceColor',[0, 0.4470, 0.7410],'EdgeColor','k','LineWidth',0.8);
bar([sAVG.NDE.aMUA.pc.coll_layers.data(:,2,L);NaN;sAVG.NDE.aMUA.pc.coll_layers.data(:,3,L)],0.4,'FaceColor',[.2, 0.2, 0.2],'EdgeColor','k','LineWidth',0.8);
set(gca,'box','off');
ylim([-5 55]);
xticklabels(labels)
xlabel('% contrast')
ylabel('Relative aMUA response');
    if L == 1
        title('Supragranular');
        legend('BIN','DE','NDE','location','northeast');
    elseif L == 2
            title('Granular');
        else 
            title('Infragranular');
    end
hold off
end

clear L c
for L = 1:3
    x1 = sAVG.BIN.aMUA.pc.coll_layers.data(:,2,L) - sAVG.DE.aMUA.pc.coll_layers.data(:,2,L);
    x2 = sAVG.BIN.aMUA.pc.coll_layers.data(:,3,L) - sAVG.DE.aMUA.pc.coll_layers.data(:,3,L);
    x3 = sAVG.BIN.aMUA.pc.coll_layers.data(:,2,L) - sAVG.NDE.aMUA.pc.coll_layers.data(:,2,L);
    x4 = sAVG.BIN.aMUA.pc.coll_layers.data(:,3,L) - sAVG.NDE.aMUA.pc.coll_layers.data(:,3,L);
subplot(2,3,L+3)
bar([x1;NaN;x2],1,'FaceColor',[0.8500, 0.5250, 0.7980],'EdgeColor','k','LineWidth',0.8);
hold on
bar([x3;NaN;x4],0.6,'FaceColor',[0.2500, 0.250, 0.2980],'EdgeColor','k','LineWidth',0.8);
set(gca,'box','off');
ylim([-5 30]);
xticklabels(labels)
xlabel('% contrast')
ylabel('difference');
hold off
end

sgtitle({'Binocular responses are stronger than their monocular counterparts'},'Interpreter','none');

%% Bar Graphs: Models (Dioptic)

labels = {0, 22, 45, 90,[],0,22,45,90}; format bank;
figure('Position', [109,115.6,1061.333,486.66]);

% clear L c
% for L = 1:3
% subplot(3,3,L)
% bar([sAVG.DE.aMUA.pc.coll_layers.data(:,2,L);NaN;sAVG.DE.aMUA.pc.coll_layers.data(:,3,L)],0.8,'FaceColor',[0, 0.4470, 0.7410],'EdgeColor','k','LineWidth',0.8);
% hold on
% bar([sAVG.NDE.aMUA.pc.coll_layers.data(:,2,L);NaN;sAVG.NDE.aMUA.pc.coll_layers.data(:,3,L)],0.6,'FaceColor',[.2, 0.2, 0.2],'EdgeColor','k','LineWidth',0.8);
% set(gca,'box','off');
% ylim([-5 80]);
% xticklabels(labels)
% xlabel('contrast')
% ylabel('aMUA response');
%     if L == 1
%         title('Supragranular');
%         lgd = legend('DE','NDE','location','northwest');
%         lgd.FontSize = 5;
%     elseif L == 2
%             title('Granular');
%         else 
%             title('Infragranular');
%     end
% hold off
% end

clear L c
for L = 1:3
subplot(2,3,L)
bar([sAVG.BIN.aMUA.pc_LSM.coll_layers.data(:,2,L);NaN;sAVG.BIN.aMUA.pc_LSM.coll_layers.data(:,3,L)],0.8,'FaceColor',[1, 1, 1],'linestyle','--','EdgeColor','k','LineWidth',0.8);
hold on
bar([sAVG.BIN.aMUA.pc.coll_layers.data(:,2,L);NaN;sAVG.BIN.aMUA.pc.coll_layers.data(:,3,L)],0.6,'FaceColor',[0.8500, 0.3250, 0.0980],'EdgeColor','k','LineWidth',0.8);
bar([sAVG.BIN.aMUA.pc_QSM.coll_layers.data(:,2,L);NaN;sAVG.BIN.aMUA.pc_QSM.coll_layers.data(:,3,L)],0.4,'FaceAlpha',[.05],'linestyle',':','EdgeColor','k','LineWidth',1);
set(gca,'box','off');
ylim([-5 80]);
xticklabels(labels)
xlabel('% contrast in both eyes')
ylabel(sprintf('aMUA response\nrelative to baseline'));
hold off
    if L == 1
        title('Supragranular');
        lgd = legend('LSM','BIN','QSM','location','northwest');
        lgd.FontSize = 5;
    elseif L == 2
            title('Granular');
        else 
            title('Infragranular');
    end
end

clear L
for L = 1:3
subplot(2,3,L+3)
bar([sAVG.BIN.aMUA.pc_LSM.coll_layers.data(:,2,L)-sAVG.BIN.aMUA.pc.coll_layers.data(:,2,L);NaN;sAVG.BIN.aMUA.pc_LSM.coll_layers.data(:,3,L)-sAVG.BIN.aMUA.pc.coll_layers.data(:,3,L)],0.8,'grouped','FaceColor',[1, 1, 1],'EdgeColor','k','LineWidth',0.8,'linestyle','--');
hold on
bar([sAVG.BIN.aMUA.pc_QSM.coll_layers.data(:,2,L)-sAVG.BIN.aMUA.pc.coll_layers.data(:,2,L);NaN;sAVG.BIN.aMUA.pc_QSM.coll_layers.data(:,3,L)-sAVG.BIN.aMUA.pc.coll_layers.data(:,3,L)],0.8,'grouped','FaceColor',[1, 1, 1],'EdgeColor','k','LineWidth',1,'linestyle',':');
set(gca,'box','off');
ylim([-15 30]);
xticklabels(labels);
xlabel('% contrast in both eyes')
ylabel('difference from model');
    if L == 1
        lgd = legend('LSM-BIN','QSM-BIN','location','northwest');
        lgd.FontSize = 5;
    end
hold off
end

%sgtitle({'Linear summation generally overpredicts binocular responses'},'Interpreter','none');
cd('C:\Users\bmitc\OneDrive\4. Vanderbilt\Maier Lab\Figures\VSS\')
export_fig(sprintf('Bar-dioptic'), '-jpg', '-transparent');
saveas(gcf, strcat('Bar-dioptic', '.svg'));

%% Bar Graphs: (Models) Dichoptic
figure('Position', [109,115.6,1061.333,486.66]);

labels = {'22|45', '22|90', '45|22', '45|90','90|22','90|45',[],'22|45','22|90','45|22','45|90','90|22','90|45'}; format bank;

clear L c
for L = 1:3
subplot(2,3,L)
bar([sAVG.DI.aMUA.pc_LSM.coll_layers.data(:,2,L);NaN;sAVG.DI.aMUA.pc_LSM.coll_layers.data(:,3,L)],0.8,'FaceColor',[1, 1, 1],'linestyle','--','EdgeColor','k','LineWidth',0.8);
hold on
bar([sAVG.DI.aMUA.pc.coll_layers.data(:,2,L);NaN;sAVG.DI.aMUA.pc.coll_layers.data(:,3,L)],0.6,'FaceColor',[.4 .7 .4],'EdgeColor','k','LineWidth',0.8);
bar([sAVG.DI.aMUA.pc_QSM.coll_layers.data(:,2,L);NaN;sAVG.DI.aMUA.pc_QSM.coll_layers.data(:,3,L)],0.4,'FaceAlpha',[.05],'linestyle',':','EdgeColor','k','LineWidth',1);
set(gca,'box','off');
ylim([-5 80]);
xticklabels(labels)
xtickangle(45)
xlabel('contrast (DE | NDE)')
ylabel(sprintf('MUA response\nrelative to baseline'));
hold off
    if L == 1
        title('Supragranular');
        lgd = legend('LSM','BIN','QSM','location','northwest');
        lgd.FontSize = 5;
    elseif L == 2
            title('Granular');
        else 
            title('Infragranular');
    end
hold off
end

clear L
for L = 1:3
subplot(2,3,L+3)
bar([sAVG.DI.aMUA.pc_LSM.coll_layers.data(:,2,L)-sAVG.DI.aMUA.pc.coll_layers.data(:,2,L);NaN;sAVG.DI.aMUA.pc_LSM.coll_layers.data(:,3,L)-sAVG.DI.aMUA.pc.coll_layers.data(:,3,L)],0.8,'grouped','FaceColor',[1, 1, 1],'EdgeColor','k','LineWidth',0.8,'linestyle','--');
hold on
bar([sAVG.DI.aMUA.pc_QSM.coll_layers.data(:,2,L)-sAVG.DI.aMUA.pc.coll_layers.data(:,2,L);NaN;sAVG.DI.aMUA.pc_QSM.coll_layers.data(:,3,L)-sAVG.DI.aMUA.pc.coll_layers.data(:,3,L)],0.8,'grouped','FaceColor',[1, 1, 1],'EdgeColor','k','LineWidth',1,'linestyle',':');
set(gca,'box','off');
ylim([-15 25]);
xticklabels(labels);
xtickangle(45)
xlabel('contrast (DE | NDE)')
ylabel('difference from model');
    if L == 1
        lgd = legend('LSM-BIN','QSM-BIN','location','northwest');
        lgd.FontSize = 5;
    end
hold off
end

%sgtitle({'Linear summation generally overpredicts binocular responses'},'Interpreter','none');

cd('C:\Users\bmitc\OneDrive\4. Vanderbilt\Maier Lab\Figures\VSS\')
export_fig(sprintf('Bar-dichoptic'), '-jpg', '-transparent');
saveas(gcf, strcat('Bar-dichoptic', '.svg'));
%% Tightplot 
figure('position',[185,41.664,645.33,599.3333333333333]);

[ha, pos] = tight_subplot(2,3,[0.005 .03],[.10 .2],[.05 .05]); %channels, columns, [spacing], [bottom and top margin], [left and right margin]
clear c
for c = 1:3
    
    axes(ha(c)); % ha is a variable that gets the axis of each subplot
    plot(squeeze(sAVG.DE.aMUA.pc.coll.aligned(c+1,2,:)),corticaldepth,'b','linewidth',.5);
    hold on
    plot(squeeze(sAVG.BIN.aMUA.pc.coll.aligned(c+1,2,:)),corticaldepth,'.-r','linewidth',0.5);
    hline(0,'-.')
    xlim([-10 100])
    yticks('')
    %yticklabels(fliplr(corticaldepth))
    %ylim([1 length(corticaldepth)])
    yticklabels({flipud(1:length(corticaldepth))});
    grid on
    hold off
    xticklabels('');
    %xlabel('Percent change');
    
    if c == 1
        ylabel('Transient');
        title({tmp.STIM.levels(c+1),'contrast'});
    else 
        title({tmp.STIM.levels(c+1),'contrast'});
    end   
   
end

clear c
for c = 4:6
    
    axes(ha(c)); % ha is a variable that gets the axis of each subplot
    plot(squeeze(sAVG.DE.aMUA.pc.coll.aligned(c-2,3,:)),corticaldepth,'b','linewidth',.5);
    hold on
    plot(squeeze(sAVG.BIN.aMUA.pc.coll.aligned(c-2,3,:)),corticaldepth','.-r','linewidth',0.5);
    hline(0,'-.')
    xlim([-10 100])
    yticks('')
    yticklabels(corticaldepth)
    %ylim([1 length(corticaldepth)])
    %yticklabels({flipud(1:length(STIM.channels))});
    grid on
    hold off
    
    xlabel('Percent change'); 
    if c == 4
        ylabel('Sustained');
    else 
   
    end
end

sgtitle({'Aligned'},'interpreter','none')



%% Contrast lines: Dioptic

cIndex = 4;

switch cIndex
    case 2
        cLevel = '.22';
    case 3
        cLevel = '.45';
    case 4
        cLevel = '.90';
end

figure('position',[151,58.333,834.66,574.66]);
clear i
subplot(1,3,1)
plot(squeeze(sAVG.DE.aMUA.pc.coll.aligned(cIndex,2,:)),corticaldepth,'linewidth',1,'Color',[0, 0.4470, 0.7410]);
hold on 
plot(squeeze(sAVG.NDE.aMUA.pc.coll.aligned(cIndex,2,:)),corticaldepth,'linewidth',.5','Color', [0, 0.4470, 0.7410]);
grid on
xlim([-5 80]);
%hline(0,':','BOL4')
ylim([-9 27])
xlabel('Percent change');
legend(sprintf('%s DE',cLevel),sprintf('%s NDE',cLevel),'Location','northeast','orientation','vertical');
title('Monocular responses');
ylabel('Contact number relative to L4/L5 boundary');
hold off

subplot(1,3,2)
plot(squeeze(sAVG.BIN.aMUA.pc.coll.aligned(cIndex,2,:)),corticaldepth,'Color','r','linewidth',1.2);
hold on 
plot(squeeze(sAVG.BIN.aMUA.pc_LSM.coll.aligned(cIndex,2,:)),corticaldepth,'linewidth',1,'linestyle','--','color',[.35 .4 .3]);
plot(squeeze(sAVG.BIN.aMUA.pc_QSM.coll.aligned(cIndex,2,:)),corticaldepth,'linewidth',1,'linestyle',':','color','k');
grid on
xlim([-5 80]);
%hline(0,':','BOL4')
ylim([-9 27])
xlabel('Percent change');
title(sprintf('Binocular response \nand Model prediction'));
legend('BIN','LSM','QSM','Location','northeast','orientation','vertical');
hold off

subplot(1,3,3)
plot(squeeze(sAVG.BIN.aMUA.pc_LSM.coll.aligned(cIndex,2,:)-(sAVG.BIN.aMUA.pc.coll.aligned(cIndex,2,:))),corticaldepth,'linewidth',1,'linestyle','--','color',[.35 .4 .3]);
hold on
plot(squeeze(sAVG.BIN.aMUA.pc_QSM.coll.aligned(cIndex,2,:)-(sAVG.BIN.aMUA.pc.coll.aligned(cIndex,2,:))),corticaldepth,'linewidth',1,'linestyle',':','color','k');
grid on
xlim([-10 30]);
ylim([-9 27])
vl = vline(0, 'k');
set(vl,'linewidth',1);
xlabel('Percent change');
title(sprintf('Model difference \nfrom Binocular response'));
legend('LSM-BIN','QSM-BIN','Location','northeast','orientation','vertical');
hold off

cd('C:\Users\bmitc\OneDrive\4. Vanderbilt\Maier Lab\Figures\VSS\')
export_fig(sprintf('%s Dioptic',cLevel), '-jpg', '-transparent');
saveas(gcf, strcat('dioptic', '.svg'));

% subplot(2,3,4)
% plot(squeeze(sAVG.DE.aMUA.pc.coll.aligned(cIndex,3,:)),corticaldepth,'linewidth',1,'Color',[0, 0.4470, 0.7410]);
% hold on 
% plot(squeeze(sAVG.NDE.aMUA.pc.coll.aligned(cIndex,3,:)),corticaldepth,'linewidth',.5','Color', [0, 0.4470, 0.7410]);
% grid on
% xlim([-5 70]);
% %hline(0,':','BOL4')
% ylim([-9 27])
% xlabel('Percent change');
% title('Monocular');
% legend(sprintf('%s DE',cLevel),sprintf('%s NDE',cLevel),'Location','northeast','orientation','vertical');
% hold off
% 
% subplot(2,3,5)
% plot(squeeze(sAVG.BIN.aMUA.pc.coll.aligned(cIndex,3,:)),corticaldepth,'Color','r');
% hold on 
% plot(squeeze(sAVG.BIN.aMUA.pc_LSM.coll.aligned(cIndex,3,:)),corticaldepth,'linewidth',.6,'linestyle','--','color',[.35 .4 .3]);
% plot(squeeze(sAVG.BIN.aMUA.pc_QSM.coll.aligned(cIndex,3,:)),corticaldepth,'-.','color','k');
% grid on
% xlim([-5 70]);
% %hline(0,':','BOL4')
% ylim([-9 27])
% xlabel('Percent change');
% title(sprintf('%s contrast in both eyes',cLevel));
% legend('BIN','LSM','QSM','Location','northeast','orientation','vertical');
% hold off
% 
% subplot(2,3,6)
% plot(squeeze(sAVG.BIN.aMUA.pc_LSM.coll.aligned(cIndex,3,:)-(sAVG.BIN.aMUA.pc.coll.aligned(cIndex,3,:))),corticaldepth,'linewidth',.6,'linestyle','--','color',[.35 .4 .3]);
% hold on
% plot(squeeze(sAVG.BIN.aMUA.pc_QSM.coll.aligned(cIndex,3,:)-(sAVG.BIN.aMUA.pc.coll.aligned(cIndex,3,:))),corticaldepth,'-.','color','k');
% grid on
% xlim([-10 30]);
% vline(0,'-k');
% hline(0,'-.')
% ylim([-9 27])
% xlabel('Percent change');
% title('Difference from data');
% legend('LSM-BIN','QSM-BIN','Location','northeast','orientation','vertical');
% hold off

% cd('C:\Users\bmitc\OneDrive\4. Vanderbilt\Maier Lab\Figures\VSS\')
% export_fig(sprintf('%s Dioptic',cLevel), '-jpg', '-transparent');

%%
%% PLOT: Collapsed lineplots (Dichoptic contrasts, QSM prediction)
% 2 = [.22], 3 = [.45], 4 = [.90]
cDE = 4;
cNDE = 3;
% 1 = DE22NDE45, 2 = DE22NDE90, 3 = DE45NDE22, 4 = DE45NDE90
% 5 = DE90NDE22, 6 = 4;3
di = 6;

switch cDE
    case 2
        DELevel = '.22';
    case 3
        DELevel = '.45';
    case 4
        DELevel = '.90';
end

switch cNDE
    case 2
        NDELevel = '.22';
    case 3
        NDELevel = '.45';
    case 4
        NDELevel = '.90';
end

figure('position',[151,58.333,834.66,574.66]);
subplot(1,3,1)
plot(squeeze(sAVG.DE.aMUA.pc.coll.aligned(cDE,2,:)),corticaldepth,'Color',[0, 0.4470, 0.7410],'linewidth',1.2);
hold on 
plot(squeeze(sAVG.NDE.aMUA.pc.coll.aligned(cNDE,2,:)),corticaldepth,'Color', [0, 0.4470, 0.7410],'linewidth',.5);
grid on
xlim([-5 80]);
%hline(0,'-.','BOL4')
ylim([-9 27])
xlabel('Percent change');
title('Monocular responses');
legend(sprintf('%s DE',DELevel),sprintf('%s NDE',NDELevel),'Location','northeast','orientation','vertical');
ylabel('Contact number relative to L4/L5 boundary');
hold off

subplot(1,3,2)
plot(squeeze(sAVG.DI.aMUA.pc.coll.aligned(di,2,:)),corticaldepth,'Color',[.4 .8 .4],'linewidth',1.2);
hold on 
plot(squeeze(sAVG.DI.aMUA.pc_LSM.coll.aligned(di,2,:)),corticaldepth,'linewidth',1,'linestyle','--','color',[.35 .4 .3]);
plot(squeeze(sAVG.DI.aMUA.pc_QSM.coll.aligned(di,2,:)),corticaldepth,'linewidth',1,'linestyle',':','color','k');
grid on
xlim([-5 80]);
%hline(0,'-.','BOL4')
ylim([-9 27])
xlabel('Percent change');
title(sprintf('Binocular response \nand Model predictions'));
legend('BIN','LSM','QSM','Location','northeast','orientation','vertical');
hold off

subplot(1,3,3)
plot(squeeze(sAVG.DI.aMUA.pc_LSM.coll.aligned(di,2,:)-(sAVG.DI.aMUA.pc.coll.aligned(di,2,:))),corticaldepth,'linewidth',1,'linestyle','--','color',[.35 .4 .3]);
hold on
plot(squeeze(sAVG.DI.aMUA.pc_QSM.coll.aligned(di,2,:)-(sAVG.DI.aMUA.pc.coll.aligned(di,2,:))),corticaldepth,'linewidth',1,'linestyle',':','color','k');
grid on
xlim([-10 20]);
%hline(0,'-.k')
ylim([-9 27])
vl = vline(0, 'k');
set(vl,'linewidth',1);
xlabel('Percent change');
title(sprintf('Model difference \nfrom Binocular response'));
legend('LSM-BIN','QSM-BIN','Location','northeast','orientation','vertical');
hold off

cd('C:\Users\bmitc\OneDrive\4. Vanderbilt\Maier Lab\Figures\VSS\')
export_fig(sprintf('%s %s Dichoptic',DELevel,NDELevel), '-jpg', '-transparent');
saveas(gcf, strcat('dichoptic', '.svg'));

% subplot(2,3,4)
% plot(squeeze(sAVG.DE.aMUA.pc.coll.aligned(cDE,3,:)),corticaldepth,'Color',[0, 0.4470, 0.7410],'linewidth',1.2);
% hold on 
% plot(squeeze(sAVG.NDE.aMUA.pc.coll.aligned(cNDE,3,:)),corticaldepth,'Color', [0, 0.4470, 0.7410],'linewidth',.5);
% grid on
% xlim([-5 70]);
% %hline(0,'-.','BOL4')
% ylim([-9 27])
% xlabel('Percent change');
% title('Monocular');
% legend(sprintf('%s DE',DELevel),sprintf('%s NDE',NDELevel),'Location','northeast','orientation','vertical');
% hold off
% 
% subplot(2,3,5)
% plot(squeeze(sAVG.DI.aMUA.pc.coll.aligned(di,3,:)),corticaldepth,'Color',[.4 .8 .4],'linewidth',1.2);
% hold on 
% plot(squeeze(sAVG.DI.aMUA.pc_LSM.coll.aligned(di,3,:)),corticaldepth,'linewidth',1,'linestyle','--','color',[.35 .4 .3]);
% plot(squeeze(sAVG.DI.aMUA.pc_QSM.coll.aligned(di,3,:)),corticaldepth,'linewidth',1,'linestyle',':','color','k');
% grid on
% xlim([-5 70]);
% %hline(0,'-.','BOL4')
% ylim([-9 27])
% xlabel('Percent change');
% title('Model Predictions vs Bincoular response');
% legend('BIN','LSM','QSM','Location','northeast','orientation','vertical');
% hold off
% 
% subplot(2,3,6)
% plot(squeeze(sAVG.DI.aMUA.pc_LSM.coll.aligned(di,3,:)-(sAVG.DI.aMUA.pc.coll.aligned(di,3,:))),corticaldepth,'linewidth',1,'linestyle','--','color',[.35 .4 .3]);
% hold on
% plot(squeeze(sAVG.DI.aMUA.pc_QSM.coll.aligned(di,3,:)-(sAVG.DI.aMUA.pc.coll.aligned(di,3,:))),corticaldepth,'linewidth',1,'linestyle',':','color','k');
% grid on
% xlim([-10 20]);
% %hline(0,'-.')
% ylim([-9 27])
% vl = vline(0, 'k');
% set(vl,'linewidth',1);
% xlabel('Percent change');
% title('Difference from data');
% legend('LSM-BIN','QSM-BIN','Location','northeast','orientation','vertical');
% hold off
% 
% 
% %sgtitle(sprintf('Quadratic  \n %s contrast in DE eye | %s contrast in NDE eye',length(fullFileName),DELevel,NDELevel));
% 
% cd('C:\Users\bmitc\OneDrive\4. Vanderbilt\Maier Lab\Figures\VSS\')
% export_fig(sprintf('%s %s Dichoptic',DELevel,NDELevel), '-jpg', '-transparent');

%% Experimental
%
figure;
superbar(sAVG.BIN.aMUA.pc.coll_layers.data(:,1,1),'E',sAVG.BIN.aMUA.pc.coll_layers.error(:,1,1),'barWidth',.8,'barFaceColor',[0.8500, 0.3250, 0.0980]);
hold on
superbar(sAVG.DE.aMUA.pc.coll_layers.data(:,1,1),'E',sAVG.DE.aMUA.pc.coll_layers.error(:,1,1),'barWidth',.4,'barFaceColor',[0, 0.4470, 0.7410]);

%% Model fit over time
figure('position',[145,88.3,786.6,541.3]);
clear i L
for L = 1:3
subplot(3,3,L)
plot(smooth(sAVG.BIN.aMUA.pc_QSM.layers.data(2,:,L)-sAVG.BIN.aMUA.pc.layers.data(2,:,L),0.1,'rloess'),'-b','linewidth',2);
hold on
plot(smooth(sAVG.BIN.aMUA.pc_LSM.layers.data(2,:,L)-sAVG.BIN.aMUA.pc.layers.data(2,:,L),0.1,'rloess'),'-r','linewidth',2);
ylim([-10 25])
xlim([0 600])
xlabel('time (ms)');
ylabel(sprintf('difference \nfrom binocular data'));
hline(0,'-.k')
plot(tmp.STIM.off, [-tmp.STIM.off tmp.STIM.off],'-.k')
    if L == 1
        title('Supragranular');
        lgd = legend('QSM','LSM','location','northwest');
        lgd.FontSize = 4;
    elseif L == 2
            title('Granular');
        else 
            title('Infragranular');
    end
end

clear i L
for L = 1:3
subplot(3,3,L+3)
plot(smooth(tmp.STIM.refwin,sAVG.BIN.aMUA.pc_QSM.layers.data(3,:,L)-sAVG.BIN.aMUA.pc.layers.data(3,:,L),0.1,'rloess'),'-b','linewidth',2);
hold on
plot(smooth(tmp.STIM.refwin,sAVG.BIN.aMUA.pc_LSM.layers.data(3,:,L)-sAVG.BIN.aMUA.pc.layers.data(3,:,L),0.1,'rloess'),'-r','linewidth',2);
ylim([-10 25])
xlim([0 600])
xlabel('time (ms)');
ylabel('difference');
hline(0,'-.k')
vline(tmp.STIM.off,'-.k')
end

clear i L
for L = 1:3
subplot(3,3,L+6)
plot(smooth(tmp.STIM.refwin,sAVG.BIN.aMUA.pc_QSM.layers.data(4,:,L)-sAVG.BIN.aMUA.pc.layers.data(4,:,L),0.1,'rloess'),'-b','linewidth',2);
hold on
plot(smooth(tmp.STIM.refwin,sAVG.BIN.aMUA.pc_LSM.layers.data(4,:,L)-sAVG.BIN.aMUA.pc.layers.data(4,:,L),0.1,'rloess'),'-r','linewidth',2);
ylim([-10 25])
xlim([0 600])
xlabel('time (ms)');
ylabel('difference');
hline(0,'-.k')
vline(tmp.STIM.off,'k')
hold off
end

sgtitle("Model difference from Binocular response (0 represents no difference)");

% cd('C:\Users\bmitc\OneDrive\4. Vanderbilt\Maier Lab\Figures\')
% export_fig(sprintf('%s_model_diff_overtime',BRdatafile), '-jpg', '-transparent');


%% Model fit over time (DIOPTIC)

figure('position',[145,88.29,552.666,541.298]);
cIndex = 2;

switch cIndex
    case 2
        cLevel = '.22';
    case 3
        cLevel = '.45';
    case 4
        cLevel = '.90';
end

clear i L
for L = 1:3
subplot(3,1,L)
plot(smooth(sAVG.BIN.aMUA.pc_LSM.layers.data(cIndex,:,L)-sAVG.BIN.aMUA.pc.layers.data(cIndex,:,L),0.1,'rloess'),'--','linewidth',1.5,'color','k');
hold on
plot(smooth(sAVG.BIN.aMUA.pc_QSM.layers.data(cIndex,:,L)-sAVG.BIN.aMUA.pc.layers.data(cIndex,:,L),0.1,'rloess'),':','linewidth',1.5,'color','k');
ylim([-10 25])
xlim([0 600])
xlabel('time (ms)');
ylabel(sprintf('difference from \nbinocular response'));
hline(0,'-.k')
%vline(tmp.STIM.off,'k','offset')
lgd = legend('LSM','QSM','location','northwest');
lgd.FontSize = 4;
   if L == 1
        title('Supragranular');
    elseif L == 2
            title('Granular');
        else 
            title('Infragranular');
    end
end

sgtitle(sprintf('Model error across stimulus duration\nDioptic: %s DE | %s NDE',cLevel,cLevel));


cd('C:\Users\bmitc\OneDrive\4. Vanderbilt\Maier Lab\Figures\VSS\')
export_fig(sprintf('%s_dioptic-time',cLevel), '-jpg', '-transparent');
saveas(gcf, strcat('dioptic-time', '.svg'));


%%
figure('position',[145,88.29,552.666,541.298]);
% 2 = [.22], 3 = [.45], 4 = [.90]
cDE = 4;
cNDE = 3;
% 1 = DE22NDE45, 2 = DE22NDE90, 3 = DE45NDE22, 4 = DE45NDE90
% 5 = DE90NDE22, 6 = 4;3
di = 6;

switch cDE
    case 2
        DELevel = '.22';
    case 3
        DELevel = '.45';
    case 4
        DELevel = '.90';
end

switch cNDE
    case 2
        NDELevel = '.22';
    case 3
        NDELevel = '.45';
    case 4
        NDELevel = '.90';
end

clear i L
for L = 1:3
subplot(3,1,L)
plot(smooth(sAVG.DI.aMUA.pc_LSM.layers.data(di,:,L)-sAVG.DI.aMUA.pc.layers.data(di,:,L),0.1,'rloess'),'--','linewidth',1.5,'color','k');
hold on
plot(smooth(sAVG.DI.aMUA.pc_QSM.layers.data(di,:,L)-sAVG.DI.aMUA.pc.layers.data(di,:,L),0.1,'rloess'),':','linewidth',1.5,'color','k');
ylim([-10 25])
xlim([0 600])
xlabel('time (ms)');
ylabel(sprintf('difference from \ndichoptic response'));
hline(0,'-.k')
%vline(tmp.STIM.off,'k','offset')
lgd = legend('LSM','QSM','location','northwest');
lgd.FontSize = 4;
   if L == 1
        title('Supragranular');
    elseif L == 2
            title('Granular');
        else 
            title('Infragranular');
    end
end

sgtitle(sprintf('Model error across stimulus duration: \nDichoptic: %s DE | %s NDE',DELevel,NDELevel));

cd('C:\Users\bmitc\OneDrive\4. Vanderbilt\Maier Lab\Figures\VSS\')
export_fig(sprintf('%s_dichoptic-time',cLevel), '-jpg', '-transparent');
saveas(gcf, strcat('dichoptic-time', '.svg'));