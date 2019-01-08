function alfa = linesearch(fname,fxt,fx,x,gx,p)
alfa = 1.0;
c1 = 1.e-04;
xt = x + alfa*p; 
fxt = feval(fname,xt);
fx = feval(fname,x);
der = c1*(gx'*p);
maxjter = 8; jter = 0;
while(fxt > fx + alfa*der && jter <= maxjter)
   alfa = alfa/2;
   xt = x + alfa*p;
   fxt = feval(fname,xt);
   jter = jter + 1;
end
if(jter == maxjter)
    alfa = 1.0;
end
        
