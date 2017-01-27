
trg = createTrigger ["EmptyDetector", getPos obj1];
trg setTriggerArea [15, 15, 45, true];
trg setTriggerActivation ["west", "PRESENT", true];
trg setTriggerStatements ["this","hint 'VC AREA IN'","hint 'AREA OUT'"];

trg2 = createTrigger ["EmptyDetector", getPos obj1];
trg2 setTriggerArea [10, 10, 45, false];
trg2 setTriggerActivation ["east", "PRESENT", true];
trg2 setTriggerStatements ["{Side _x == EAST} count thislist >= 8","hint '8man ok'","hint 'no 8man'"];

_unit =[
"uns_men_VC_local_nco",
"uns_men_VC_local_SAP",
"uns_men_VC_local_RF1",
"uns_men_VC_local_MRK",
"uns_men_VC_local_AS2",
"uns_men_VC_local_LMG",
"uns_men_VC_local_off",
"uns_men_VC_local_RF7",
"uns_men_VC_local_MED",
"uns_men_VC_local_LMG",
"uns_men_VC_local_AS5",
"uns_men_VC_local_AS4",
"uns_men_VC_local_SAP",
"uns_men_VC_local_MRK"
];


while {true} do {

if (triggerActivated trg) then {

hint "Activeated";

[west,["task1"],["Destory Spider Hall!!","Find Spider Hall","cookiemarker2"],objNull,1,3,true] call BIS_fnc_taskCreate;

for "_i" from 0 to 8 do {
group vc createUnit [_unit call BIS_fnc_selectRandom,getpos obj1,[],0,"FORM"];

sleep 8 ;

[group vc, getPos obj1, 100] call bis_fnc_taskPatrol;

} ;
waitUntil {(!(triggerActivated trg)) or (!(alive obj1))};
};

};
