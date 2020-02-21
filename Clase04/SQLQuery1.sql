restore headeronly 
from disk = 'G:\EGCC\BAK\CS-EDUTEC.BAK';
go


restore FILELISTONLY 
from disk = 'G:\EGCC\BAK\CS-EDUTEC.BAK';
go

restore LABELONLY 
from disk = 'G:\EGCC\BAK\CS-EDUTEC.BAK';
go

restore VERIFYONLY 
from disk = 'G:\EGCC\BAK\CS-EDUTEC.BAK'
WITH FILE = 3;
go