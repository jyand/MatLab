 function val=Lagrange(x,f,a,b,n)
xi=linspace(a,b,n);
yi=f(xi);
val=0;
 for i=1:length(xi)
 Li=1;
 for j=1:length(xi)
     if i~=j
         Li=Li.*( (x-xi(j) )./(xi(i)-xi(j) ) );
     end
 end
 val=val+Li.*yi(i);
 end
 
 end