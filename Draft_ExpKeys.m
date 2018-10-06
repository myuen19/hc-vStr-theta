ExpKey.version = 1.0;

ExpKeys.notes = 'CSC28, CSC29 are reference, not CA1. Only CSC17, CSC18 are DG. CSC19, CSC20 are open.'

ExpKeys.experimenter = 'EC_MY'
ExpKeys.species = 'Rat'
ExpKeys.Rat_id = '';

ExpKeys.Date = '';
ExpKeys.Session_id = [ExpKeys.Rat_id '-' ExpKeys.Date];

ExpKeys.RatWeight = '';
ExpKeys.Exp_Day = '';
ExpKeys.Order = {'pre',  'contra', 'ipsi', 'post'};

ExpKeys.task = [15465, 16084; 16125, 16905];
ExpKeys.taskBlocks = {'pot'; 'track'}

ExpKeys.goodGamma = {'csc5.ncs'}; %this is great for single target areas but for this experiment we will need a "goodGamma" for one electrode per site that we are going to use. 
ExpKeys.goodTheta = {''}; % same as above.  

ExpKeys.prerecord = []  % start and end times of prerecord
ExpKeys.postrecord = []  % start and end times of postrecord

%% constants
ExpKeys.Behavior = 'Multisite Naris'; % maybe "V_maze" since that was the task.  Pre and post records are always on the pot, but the V maze might be useful in other analyses. 

ExpKeys.targets = {'vSub','Amy','Piri','vHC','NAc','PL','CA1'}; %since we have the staggered Ref/CA1/DG those should be treated as their own sites, so I would add Ref and DG. 

ExpKeys.TetrodeTargets = [1 2 3 4 5 6 7];
ExpKeys.TetrodeDepths = [];
ExpKeys.CSC = {'csc1.ncs', 'csc5.ncs','csc9.ncs','csc13.ncs','csc21.ncs','csc25.ncs','csc31.ncs'};


ExpKeys.Depths = [];
ExpKeys.Depths_target = [];
ExpKeys.Target_diff = ExpKeys.Depth_targets - ExpKeys.Depths;