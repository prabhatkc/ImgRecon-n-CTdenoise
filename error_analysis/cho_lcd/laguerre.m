function L=laguerre(x,J)
%function L=laguerre(x,J)
%Calculate the laguerre polynomials
%==========================================================================
%           Legal Disclaimer
%This software and documentation (the "Software") were developed at the 
%Food and Drug Administration (FDA) by employees of the Federal Government
%in the course of their official duties. Pursuant to Title 17, Section 105 
%of the United States Code, this work is not subject to copyright 
%protection and is in the public domain. Permission is hereby granted, 
%free of charge, to any person obtaining a copy of the Software, to deal 
%in the Software without restriction, including without limitation the 
%rights to use, copy, modify, merge, publish, distribute, sublicense, or 
%sell copies of the Software or derivatives, and to permit persons to whom 
%the Software is furnished to do so. FDA assumes no responsibility 
%whatsoever for use by other parties of the Software, its source code, 
%documentation or compiled executables, and makes no guarantees, expressed 
%or implied, about its quality, reliability, or any other characteristic. 
%Further, use of this code in no way implies endorsement by the FDA or 
%confers any advantage in regulatory decisions. Although this software can 
%be redistributed and/or modified freely, we ask that any derivative works 
%bear some notice that they are derived from it, and any modified versions 
%bear some notice that they have been modified.
%==========================================================================

L=zeros(length(x),J+1);
for j=0:J
    combin=factorial(j)./(factorial([0:j]).*factorial(j-[0:j]));    
    for k=0:j
        L(:,j+1)=combin(k+1).*((-x).^k) /factorial(k) + L(:,j+1);
    end
end
