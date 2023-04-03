use monitor;

insert into rtus (rtu, rtutext , url, port) values
('SE-TOMEZA-SE', 'SE-TOMEZA-SE', 'opc.tcp://localhost', '55480');

insert into b1 (b1, b1text) values
('SE-TOMEZA-SE', 'SE-TOMEZA-SE');

insert into b2 (b2, b2text) values
('25kV_C', '25kV_C'),
('25kV_F', '25kV_F');

insert into b3 (b3, b3text) values
('CF11', 'CF11'),
('CF12', 'CF12'),
('CF21', 'CF21'),
('CF22', 'CF22');


insert into elemtypes (elemtype, alarmlist, eventlist, priority, mstate_0, mstatetext_0, mstate_1, mstatetext_1, mstate_2, mstatetext_2, mstate_3, mstatetext_3, cstate_0, cstatetext_0, cstate_1, cstatetext_1) values
('e4m2c', 1, 1, 1, 0, 'INDEFINIDO', 1, 'ABIERTO', 2, 'CERRADO', 3, 'INDEFINIDO', 1, 'ABRIR', 2, 'CERRAR');

insert into elements (elem, elemtext, elemtype) values
('Q52', 'INTERRUPTOR Q52', 'e4m2c');


insert into points (b1, b2, b3, elem, rtu, mon_nodeid, mon_quality_nodeid, mon_time_nodeid, con_nodeid, inversion) values
('SE-TOMEZA-SE', '25kV_C', 'CF11', 'Q52', 'SE-TOMEZA-SE',  'ns=1;s=SE-TOMEZA-SE/25kV/CF11/Q52/Status', 'ns=1;s=SE-TOMEZA-SE/25kV/CF11/Q52/Qual', 'ns=1;s=SE-TOMEZA-SE/25kV/CF11/Q52/Ts', 'ns=1;s=SE-TOMEZA-SE/25kV/CF11/Q52/Ctrl', 0),
('SE-TOMEZA-SE', '25kV_C', 'CF12', 'Q52', 'SE-TOMEZA-SE',  'ns=1;s=SE-TOMEZA-SE/25kV/CF12/Q52/Status', 'ns=1;s=SE-TOMEZA-SE/25kV/CF12/Q52/Qual', 'ns=1;s=SE-TOMEZA-SE/25kV/CF12/Q52/Ts', 'ns=1;s=SE-TOMEZA-SE/25kV/CF12/Q52/Ctrl', 0),
('SE-TOMEZA-SE', '25kV_C', 'CF21', 'Q52', 'SE-TOMEZA-SE',  'ns=1;s=SE-TOMEZA-SE/25kV/CF21/Q52/Status', 'ns=1;s=SE-TOMEZA-SE/25kV/CF21/Q52/Qual', 'ns=1;s=SE-TOMEZA-SE/25kV/CF21/Q52/Ts', 'ns=1;s=SE-TOMEZA-SE/25kV/CF21/Q52/Ctrl', 0),
('SE-TOMEZA-SE', '25kV_C', 'CF22', 'Q52', 'SE-TOMEZA-SE',  'ns=1;s=SE-TOMEZA-SE/25kV/CF22/Q52/Status', 'ns=1;s=SE-TOMEZA-SE/25kV/CF22/Q52/Qual', 'ns=1;s=SE-TOMEZA-SE/25kV/CF22/Q52/Ts', 'ns=1;s=SE-TOMEZA-SE/25kV/CF22/Q52/Ctrl', 0);


insert into status (b1, b2, b3, elem) values
('SE-TOMEZA-SE', '25kV_C', 'CF11', 'Q52'),
('SE-TOMEZA-SE', '25kV_C', 'CF12', 'Q52'),
('SE-TOMEZA-SE', '25kV_C', 'CF21', 'Q52'),
('SE-TOMEZA-SE', '25kV_C', 'CF22', 'Q52');