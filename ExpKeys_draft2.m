ExpKey.version = 1.0;

ExpKeys.notes = 'CSC28, CSC29 are reference, not CA1. Only CSC17, CSC18 are DG. CSC19, CSC20 are open.'

ExpKeys.experimenter = {'EC; MY'}
ExpKeys.species = 'Rat'
ExpKeys.Rat_id = '';

ExpKeys.Date = '';
ExpKeys.Session_id = [ExpKeys.Rat_id '-' ExpKeys.Date];

ExpKeys.RatWeight = '';
ExpKeys.Exp_Day = '';
ExpKeys.Order = {'pre',  'contra', 'ipsi', 'post'};

ExpKeys.task = [15465, 16084; 16125, 16905];
ExpKeys.taskBlocks = {'pot'; 'track'}

ExpKeys.vSub_goodGamma = {'csc5.ncs'};
ExpKeys.Amy_goodGamma = {''};
ExpKeys.Piri_goodGamma = {''};
ExpKeys.vHC_goodGamma = {''};
ExpKeys.NAc_goodGamma = {''};
ExpKeys.PL_goodGamma = {''};
ExpKeys.REF_goodGamma = {''};
ExpKeys.CA1_goodGamma = {''};
ExpKeys.DG_goodGamma = {''}

ExpKeys.vSub_goodTheta = {''};
ExpKeys.Amy_goodTheta = {''};
ExpKeys.Piri_goodTheta = {''};
ExpKeys.vHC_goodTheta = {''};
ExpKeys.NAc_goodTheta = {''};
ExpKeys.PL_goodTheta = {''};
ExpKeys.REF_goodTheta = {''};
ExpKeys.CA1_goodTheta = {''};
ExpKeys.DG_goodTheta = {''};

ExpKeys.prerecord = [];  % start and end times of prerecord
ExpKeys.postrecord = [];  % start and end times of postrecord

ExpKeys.VTConvFactor = [];

%% constants
ExpKeys.Behavior = 'V_maze';

ExpKeys.targets = {'vSub','Amy','Piri','vHC','NAc','PL', 'dHC-REF', 'dHC-CA1', 'dHC-DG', 'Open'}; %since we have the staggered Ref/CA1/DG those should be treated as their own sites, so I would add Ref and DG. 
ExpKeys.TetrodeTargets = [1 2 3 4 5 6 7 8 9, 10];
ExpKeys.TetrodeDepths = [];
ExpKeys.CSC = {'CSC011.ncs', 'CSC02.ncs','CSC03.ncs','CSC04.ncs','CSC05.ncs','CSC06.ncs', 'CSC07.ncs', 'CSC08.ncs', 'CSC09.ncs', 'CSC10.ncs'};


ExpKeys.Depths = [];
ExpKeys.Depths_target = [];
ExpKeys.Target_diff = ExpKeys.Depth_targets - ExpKeys.Depths;