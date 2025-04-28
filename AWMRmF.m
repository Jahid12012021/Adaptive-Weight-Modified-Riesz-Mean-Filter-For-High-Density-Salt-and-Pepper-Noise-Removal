function X=AWMRmF(A)
A=double(A);
 for p=6:-1:1  
  pA=padarray(A,[p p],'symmetric');
  pB=(pA~=0 & pA~=255);
  [m,n]=size(pB);
  for i=1+p:m-p
    for j=1+p:n-p       
       if (pB(i,j)==0)
            for k=1:p   
                if (pA(i,j)==0 || pA(i,j)==255)              
                    Wk=pA(i-k:i+k,j-k:j+k);
                    A(i-p,j-p)=MRmeanModified(Wk);
                end
            end
       end
    end 
  end   
 end
  X=uint8(A);
end
function WMRm=MRmeanModified(W1)
[n,~]=size(W1);
k=(n-1)/2;                          
uk=0;
qk=0;                            
 for s=1:n
  for t=1:n
   if(W1(s,t)~=0 && W1(s,t)~=255)
    pw=(1/(1+(4^(k+1))*(k+1-s)^2+(4^(k+1))*(k+1-t)^2)^2);
    uk=uk+pw*W1(s,t);
    qk=qk+pw;
   end
  end
 end                                                       
WMRm=uk/qk;
end
