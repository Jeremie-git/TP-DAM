-- MON INSERT ZOO --
--------------------

set datestyle to european;

-------------------------------------------
-- Cages
-----------------------------------------
insert into cage values(1,'A1','volière');
insert into cage values(2,'B1','fosse aux ours');
insert into cage values(3,'B3','cage à fauves');
insert into cage values(4,'A2','cage à poules');
insert into cage values(5,'B2','parc');
insert into cage values(6,'C1','aquarium');
insert into cage values(7,'C2','vivarium');
insert into cage values(8,'A3','volière');
insert into cage values(9,'B4','cage à fauves');
insert into cage values(10,'C3','aquarium');
insert into cage values(11,'D1','infirmerie');

-------------------------------------------
-- Animaux
-------------------------------------------
insert into animal values('dumbo','éléphant','m','inde','12/01/2000',5);
insert into animal values('kalanag','éléphant','m','inde','17/01/1957',5);
insert into animal values('bimbo','éléphant','f','afrique','12/01/2000',11);
insert into animal values('baghera','panthère','f','afrique','24/03/2008',9);
insert into animal values('roi lion','lion','m','afrique','2/02/2000',3);
insert into animal values('simba','lion','f','afrique','11/03/1998',11);
insert into animal values('leo','lion','m','afrique','1/01/1986',3);
insert into animal values('shere khan','tigre','m','asie','17/01/2003',3);
insert into animal values('titi','oiseau','m','europe','2/02/2010',1);
insert into animal values('coco','oiseau','m','asie','3/08/2009',1);
insert into animal values('lyre','oiseau','f','europe','12/02/2010',1);
insert into animal values('cui-cui','oiseau','m','europe','17/11/2010',1);
insert into animal values('niko','requin','m','asie','16/05/2007',7);
insert into animal values('brice','serpent','m','europe','16/05/2007',7);
insert into animal values('fifi','serpent','m','europe','16/05/2007',7);
insert into animal values('cotcot','poule','f','europe','6/06/2011',4);
insert into animal values('cocorico','coq','m','europe','6/06/2012',4);
insert into animal values('baloo','ours','m','oceanie','6/06/2006',11);
insert into animal values('lulu','poule','f','europe','6/06/2010',8);
insert into animal values('arc en ciel','poisson','f','asie','16/06/2015',6);
insert into animal values('poisson panné','poisson','m','europe','11/03/2016',6);
insert into animal values('gaulois','coq','m','europe','11/03/2015',4);
insert into animal values('ovni','poisson','f','asie','3/01/2016/',10);
-------------------------------------------
-- Gardiens
-------------------------------------------
insert into gardien values(1,'Gaston Lagaffe','Dupuis','11/03/1986');
insert into gardien values(2,'Spirou','Dupuis','15/08/1990');
insert into gardien values(3,'Fantasio','Dupuis','15/08/1990');
insert into gardien values(4,'Asterix','Dargaud','11/12/1992');
insert into gardien values(5,'Barbapapa','Dupuis','12/09/1991');
insert into gardien values(6,'Tintin','Casterman','11/03/1988');

--------------------------------------------
-- Animaux malades
--------------------------------------------
insert into estmalade values('cotcot','typhus','25/01/2012','15/02/2012',4,'medoc');
insert into estmalade values('cotcot','typhus','4/05/2012','10/05/2012',4,'medoc');
insert into estmalade values('cotcot','typhus','5/06/2012','7/06/2012',4,'medoc');
insert into estmalade values('cotcot','gale','10/06/2013','15/06/2013',4,'medoc+');
insert into estmalade values('cotcot','typhus','10/06/2013','15/06/2013',4,'medoc+');
insert into estmalade values('cocorico','typhus','10/06/2013','15/06/2013',4,'medoc');
insert into estmalade values('cocorico','typhus','10/06/2014','12/06/2014',4,'medoc');
insert into estmalade values('cocorico','typhus','10/06/2015','13/06/2015',4,'medoc+');
insert into estmalade values('cocorico','gale','10/06/2015','13/06/2015',4,'medoc+');
insert into estmalade values('gaulois','typhus','10/06/2015','13/06/2015',4,'medoc+');
insert into estmalade values('baloo','grippe','10/12/2015','20/01/2016',2,'doliprane');
insert into estmalade values('baloo','gale',current_date-8,null,2,'medoc+');
insert into estmalade values('baloo','typhus',current_date-8,null,2,'medoc+');
insert into estmalade values('simba','typhus',current_date-7,null,3,'medoc');
insert into estmalade values('bimbo','pneumonie',current_date-5,null,5,'super medoc');


--------------------------------------------
-- Responsables des cages
--------------------------------------------
insert into soccupe values(1,1);
insert into soccupe values(1,2);
insert into soccupe values(1,3);
insert into soccupe values(1,4);
insert into soccupe values(1,5);
insert into soccupe values(1,6);
insert into soccupe values(1,7);
insert into soccupe values(1,8);
insert into soccupe values(1,9);
insert into soccupe values(1,10);
insert into soccupe values(2,1);
insert into soccupe values(2,2);
insert into soccupe values(3,3);
insert into soccupe values(3,4);
insert into soccupe values(3,5);
insert into soccupe values(3,6);
insert into soccupe values(4,7);
insert into soccupe values(4,8);
insert into soccupe values(5,3);
insert into soccupe values(6,1);
insert into soccupe values(6,3);
insert into soccupe values(6,10);
insert into soccupe values(1,11);



