ExpKey.version = 1.0;  % not sure what this refers to

ExpKeys.notes = 'vSub tetrode actually hit vDG, so no viable vSub; vHC tetrode actually hit dDG; CA1 and Ref stereotrode bad'

ExpKeys.experimenter = {'EC; MY'}
ExpKeys.species = 'Rat'
ExpKeys.Rat_id = 'R130';

ExpKeys.Date = '2019_10_19';  % is this date supposed to be for when I created this ExpKeys, or when the data collection session was?
ExpKeys.Session_id = [ExpKeys.Rat_id '-' ExpKeys.Date];

ExpKeys.RatWeight = '';  % don't know this yet. I should look up the weight for this week in the logbooks
ExpKeys.Exp_Day = '2017_09_14';
ExpKeys.Order = {'contra'};

ExpKeys.task = [, ; , ];  % not sure if this is the correct time points. Need to look up the data times
ExpKeys.taskBlocks = {'pot'; 'track'}

ExpKeys.vSub_goodGamma = {''};  % did not hit
ExpKeys.Amy_goodGamma = {'CSC07.ncs'};
ExpKeys.Piri_goodGamma = {'CSC09.ncs'};
ExpKeys.vHC_goodGamma = {'CSC02.ncs'};  % this tetrode was meant for vSub, but histology shows it hit vHC. 
ExpKeys.NAc_goodGamma = {'CSC22.ncs'}; 
ExpKeys.PL_goodGamma = {'CSC25.ncs'};
ExpKeys.REF_goodGamma = {''};  % did not hit
ExpKeys.CA1_goodGamma = {''};  % did not hit
ExpKeys.DG_goodGamma = {'CSC13.ncs'}  % this was meant to be vHC, but histology shows it was dDG; not sure if this was this tetrode or CSC19-20?

ExpKeys.vSub_goodTheta = {''};  % did not hit
ExpKeys.Amy_goodTheta = {'CSC07.ncs'};  
ExpKeys.Piri_goodTheta = {'CSC09.ncs'};  
ExpKeys.vHC_goodTheta = {'CSC02.ncs'};  % this tetrode was meant for vSub, but histology shows it hit vHC. 
ExpKeys.NAc_goodTheta = {'CSC22.ncs'};
ExpKeys.PL_goodTheta = {'CSC25.ncs'};
ExpKeys.REF_goodTheta = {''};  % did not hit
ExpKeys.CA1_goodTheta = {''};  % did not hit
ExpKeys.DG_goodTheta = {'CSC13.ncs'};  % this was meant to be vHC, but histology shows it was dDG; not sure if this was this tetrode or CSC19-20?

ExpKeys.prerecord = [];  % start and end times of prerecord
ExpKeys.postrecord = [];  % start and end times of postrecord

ExpKeys.VTConvFactor = [];

%% constants
ExpKeys.Behavior = 'V_maze';

ExpKeys.targets = {'vSub','Amy','Piri','vHC','NAc','PL', 'dHC-REF', 'dHC-CA1', 'dHC-DG', 'Open'}; %since we have the staggered Ref/CA1/DG those should be treated as their own sites, so I would add Ref and DG. 
ExpKeys.TetrodeTargets = [1 2 3 4 5 6 7 8 9, 10];
ExpKeys.TetrodeDepths = [];
ExpKeys.CSC = {};


ExpKeys.Depths = [];
ExpKeys.Depths_target = [];
ExpKeys.Target_diff = ExpKeys.Depth_targets - ExpKeys.Depths;