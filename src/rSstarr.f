      SUBROUTINE rsstarr(x, np, nsize, jl, sigma, rssr)
C x: residuals from function vcrobresid (internals.R)
C sigma: var/cov matrix from function Vprod (internals.R)

      implicit double precision(a-h,o-z)
      implicit integer (n,i,j,l)

      dimension x(np, nsize), sigma(np,np), rssr(jl, nsize)
      dimension x2(2), s(2,2), sinvstar(2,2) 
      external dinvstar
      external dmahal2

      jlindex = 0
      do 10 j=1,(np-1)
        do 20 l=(j+1),np
          jlindex = jlindex+1
          s(1,1) = sigma(j,j)
          s(1,2) = sigma(j,l)
          s(2,1) = sigma(l,j)
          s(2,2) = sigma(l,l) 
          call dinvstar(s, sinvstar)
          do 30 i=1,nsize
            x2(1) = x(j,i)
            x2(2) = x(l,i)
            call dmahal2(x2, sinvstar, rssr(jlindex,i))
CC            write(*,*) sinvstar
CC            write (*,*) x2
CC            write (*,*) rssr(jlindex,i)
 30       continue
 20     continue
 10   continue
      return
      end
