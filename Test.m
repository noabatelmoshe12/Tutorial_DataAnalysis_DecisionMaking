clear all
load('ephysDataset.mat')
cell_idx = 100; % cell at 100th row of the ephysDataset array
seesionInfo = ephysDataset(cell_idx).sessionIndex;
unitInfo = ephysDataset(cell_idx).nUnit;

cell_idx = 100; % cell at 100th row of the ephysDataset
nTrial = 2; % the second lick-right trial
psth = ephysDataset(cell_idx).sr_right(nTrial,:);


cell_idx = 1; % cell at 1st row of the ephysDataset
nTrial = 2; % the second lick-right trial
spkTime = ephysDataset(cell_idx).st_right{nTrial};


cell_idx = 100; % cell at 100th row of the ephysDataset
nTrial = 10; % the second lick-right trial
spkTime = ephysDataset(cell_idx).st_right{nTrial};
figure;
plot(spkTime, ones(size(spkTime)), '.');

cell_idx = 1; % cell at 1st row of the ephysDataset
nTrial = 10; % the second lick-right trial
psth = ephysDataset(cell_idx).sr_right(nTrial,:);
figure;
plot(timeTag, psth);

cellId = 1; % cell to plot
meanR = mean(ephysDataset(cellId).sr_right,1); % mean PSTH of lick R trial
meanL = mean(ephysDataset(cellId).sr_left,1); % mean PSTH of lick L trial
figure
hold on
plot(timeTag,meanR,'b')
plot(timeTag,meanL,'r')
gridxy([-2.6 -1.3 0],'Color','k','Linestyle','--') ; % plot timing of each epoch
xlim([-3  1.5]); % range of X axis
xlabel('Time (s)')
ylabel('Spikes per s')
hold off

sampleRate = 14.84;
meanR = mean(ephysDataset(cellId).sr_right,1)/sampleRate;
varR  = var(ephysDataset(cellId).sr_right,1)/sampleRate^2;
FF_R  = varR./meanR;
