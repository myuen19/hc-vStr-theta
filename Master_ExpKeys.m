’ExpKey.version = 1.0;

ExpKeys.notes = ‘dHC3 was on and off noisy’

ExpKeys.experimenter = ‘EC’
ExpKeys.species = ‘Rat’
ExpKeys.Rat_id = ‘R073’;

ExpKeys.Date = ‘2015-12-08’;
ExpKeys.Session_id = [ExpKeys.Rat_id ‘-’ ExpKeys.Date];

ExpKeys.RatWeight = ‘398’;
ExpKeys.Exp_Day = 1;
ExpKeys.Order = {‘pre’,  ‘contra’, ‘ipsi’, ‘post’};

ExpKeys.task = [15465, 16084; 16125, 16905];
ExpKeys.taskBlocks = {‘pot’; ‘track’}


ExpKeys.goodGamma = {};
ExpKeys.goodTheta = {};

%% constants
ExpKeys.Behavior = ‘Multisite Naris’;


ExpKeys.targets = {‘mPFC’, ‘NAcc’, ‘Piri’, ‘Ref’, ‘dHC’, ‘Amy’, ‘vHC’, ‘vSub’};
ExpKeys.CSC = {‘csc1.ncs’, }

ExpKeys.Depths = [5.16, 7.8, 7.72, 9.88, 4.12, 2.64, 8.28, 7.24];
ExpKeys.Depths_target = [5, 7.6, 7.2, 9, 2, 2, 9, 8.2];
ExpKeys.Target_diff = ExpKeys.Depth_targets - ExpKeys.Depths;