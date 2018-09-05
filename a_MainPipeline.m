%% Load Code Base
restoredefaultpath %restore search path to factory-installed state.

PARAMS.code_base_dir = '/Users/Matthew/Documents/GitHub/vandermeerlab/code-matlab/shared'; 
PARAMS.code_MS_dir = '/Users/Matthew/Documents/GitHub/EC_Multisite'; 

addpath(genpath(PARAMS.code_base_dir)); %adding in the codebase of mvdm lab
addpath(genpath(PARAMS.code_MS_dir)); %adding in the codebase of EC_Multisite

%% Bring us to R020 Folder
hc_vstr.data_trk = '/Users/Matthew/Documents/Data/R020-2012-12-17' 
cd(hc_vstr.data_trk)  %bring us to R020 data folder.

%% load expkeys
LoadExpKeys(); %load R020 expkeys
evt= LoadEvents([]); %load events

%% load hippocampus and ventral striatum data
cfg_hc = [];
cfg_hc.fc = {'R020-2012-12-17-CSC03a.ncs'}; 
csc_hc = LoadCSC(cfg_hc); %loading hc's csc data for that particular channel

cfg_vstr = []; 
cfg_vstr.fc = {'R020-2012-12-17-CSC02d.ncs'};
csc_vstr = LoadCSC(cfg_vstr); %loading vstr's csc data for that particular channel

%% restricting data of hc and vstr
restricted_hc_1 = restrict(csc_hc,ExpKeys.TimeOnTrack(1),ExpKeys.TimeOffTrack(1)); %restricting hc csc data to the time on the track 
restricted_hc_2 = restrict(csc_hc,ExpKeys.TimeOnTrack(2),ExpKeys.TimeOffTrack(2));

restricted_vstr_1 = restrict(csc_vstr,ExpKeys.TimeOnTrack(1),ExpKeys.TimeOffTrack(1));
restricted_vstr_2 = restrict(csc_vstr,ExpKeys.TimeOnTrack(2),ExpKeys.TimeOffTrack(2)); %restricting vstr csc data to the time on the track 

%% let's look at our data
% figure(1);
% plot(restricted_hc);

% figure(2);
% plot(restricted_vstr);

%% filtering the csc data
cfg_f = []; %setting config
cfg_f.f = [5 10]; %setting theta interval (hertz)
cfg_f.type = 'cheby1'; %the type of filter I want to use via filterlfp 
cfg_f.order = 3 %type of order I'm using
filtered_hc_1 = FilterLFP(cfg_f,restricted_hc_1); %filtering restricted data of hc
filtered_hc_2 = FilterLFP(cfg_f,restricted_hc_2);
filtered_vstr_1 = FilterLFP(cfg_f,restricted_vstr_1); %filtering restricted data of hc
filtered_vstr_2 = FilterLFP(cfg_f,restricted_vstr_2);
%% creating the envelopes
hc_envelope_1 = filtered_hc_1;
hc_envelope_2 = filtered_hc_2;
hc_envelope_1.data = abs(hilbert(hc_envelope_1.data));
hc_envelope_2.data = abs(hilbert(hc_envelope_2.data));

vstr_envelope_1 = filtered_vstr_1;
vstr_envelope_2 = filtered_vstr_2;
vstr_envelope_1.data = abs(hilbert(vstr_envelope_1.data));
vstr_envelope_2.data = abs(hilbert(vstr_envelope_2.data));

%% TSDtoIV of hc
cfg_a = [];
cfg_a.method = 'zscore'; 
cfg_a.threshold = 1.0; % 
cfg_a.minlen = 0.25; % exclude intervals shorter than 25 ms
cfg_a.merge_thr = 0.05;
cfg_a.operation = '>'; %tells the function whether or not you want to keep the data above or below it
cfg_a.dcn = cfg_a.operation;

hc_IV_1 = TSDtoIV(cfg_a,hc_envelope_1); %create interval data from tsd by thresholding. 
hc_IV_2 = TSDtoIV(cfg_a,hc_envelope_2);
%evt is the set of candidate events; finds the intervals that match up with our parameters.
 
%% see what the actual data looks like for each hc interval found.
cfg_plot=[];
cfg_plot.display = 'iv';
cfg_plot.mode = 'edges';
%PlotTSDfromIV(cfg_plot, hc_IV, restricted_hc) %PlotTSDfromIV(cfg,iv_in,tsd_in) is how you'd put it in.

%% load old style position data
x_y = load('R020-2012-012-17-vt.mat');

pos = []
pos.type = 'tsd';
pos.units = 'px';
pos.data(1,:) = x_y.x.data;
pos.data(2,:) = x_y.y.data;
pos.tvec = x_y.x.t;
pos.label= {'x'  'y'};
pos.cfg.history.mfun = {};
pos.cfg.history.cfg = {};

restricted_pos_1 =  restrict(pos,ExpKeys.TimeOnTrack(1),ExpKeys.TimeOffTrack(1)); %restrict data to the same as cscR
restricted_pos_2 =  restrict(pos,ExpKeys.TimeOnTrack(2),ExpKeys.TimeOffTrack(2));
%% Speed threshold
linspeed_1 = getLinSpd([],restricted_pos_1);
linspeed_2 = getLinSpd([],restricted_pos_2);

cfg = []; 
cfg.method = 'raw'; 
cfg.operation = '>'; 
cfg.minlen=2; 
cfg.threshold = 2; % speed limit in cm/sec
iv_fast_1 = TSDtoIV(cfg,linspeed_1); % keep only intervals with speed above thresh
iv_fast_2 = TSDtoIV(cfg,linspeed_2);
%% put the speed IV and the Pow IV together
%keep the intervals that are in the the speed threshold as well as the theta intervals. 

Keep_IV_1 = IntersectIV([], hc_IV_1,iv_fast_1); %just means empty config.
Keep_IV_2 = IntersectIV([],hc_IV_2,iv_fast_2);
close all 
%PlotTSDfromIV(cfg_plot, Keep_IV, restricted_hc);

%% Plotting interval length
% interval_length = Keep_IV.tend - Keep_IV.tstart;
% plot(interval_length); 

%% calculate correlation of values in the intervals

n_1 = numel(Keep_IV_1.tstart);
r_values_1 = [];
x = 1;
while n_1 > 0
    restricted_hc_envelope_1 = restrict(hc_envelope_1,Keep_IV_1.tstart(x),Keep_IV_1.tend(x));
    restricted_vstr_envelope_1 = restrict(vstr_envelope_1,Keep_IV_1.tstart(x),Keep_IV_1.tend(x));
    correlated = corrcoef(restricted_hc_envelope_1.data,restricted_vstr_envelope_1.data);
    r = correlated(2);
    r_values_1(x) = r;
    x = x + 1;
    n_1 = n_1 - 1;
%         figure(n)
%     plot(restricted_hcenvelope.tvec, restricted_hcenvelope.data, 'r', restricted_vstrenvelope.tvec, restricted_vstrenvelope.data, 'c')
%     title(r)
%     pause(2)
%     close
end

b = numel(Keep_IV_2.tstart);
r_values_2 = [];
c = 1;

while b > 0
    restricted_hc_envelope_2 = restrict(hc_envelope_2,Keep_IV_2.tstart(c),Keep_IV_2.tend(c));
    restricted_vstr_envelope_2 = restrict(vstr_envelope_2,Keep_IV_2.tstart(c),Keep_IV_2.tend(c));
    correlated = corrcoef(restricted_hc_envelope_2.data,restricted_vstr_envelope_2.data);
    r = correlated(2);
    r_values_2(c) = r;
    c = c + 1;
    b = b - 1;
%         figure(n)
%     plot(restricted_hcenvelope.tvec, restricted_hcenvelope.data, 'r', restricted_vstrenvelope.tvec, restricted_vstrenvelope.data, 'c')
%     title(r)
%     pause(2)
%     close
end

average_r_1= mean(r_values_1);
average_r_2= mean(r_values_2);

average_r = ((average_r_1 + average_r_2)/2);

% median_r_1 = median(r_values_1);
% median_r_2 = median(r_values_2);
merge_r = [r_values_1, r_values_2];
sorted_merge_r = sort(merge_r);
median_r = median(sorted_merge_r);
    
disp(['Mean R: ' num2str(average_r)]);
disp(['Median R: ' num2str(median_r)]);