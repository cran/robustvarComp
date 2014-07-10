       SUBROUTINE rvr(x, np, nsize, jl, v, nr, rvir)
C x: residuals from function lmmrobresid (internals.R)

      implicit double precision(a-h,o-z)
      implicit integer (n,i,j,k,l)

      dimension x(np, nsize), v(np,np,nr), rvir(jl, nsize, nr)
      dimension x2(2), s(2,2)
      external dmahal2

      jlindex = 0
      do 10 j=1,(np-1)
        do 20 l=(j+1),np
          jlindex = jlindex+1
          do 30 k=1,nr
            s(1,1) = v(l,l,k)
            s(1,2) = -v(j,l,k)
            s(2,1) = -v(l,j,k)
            s(2,2) = v(j,j,k) 
            do 40 i=1,nsize
              x2(1) = x(j,i)
              x2(2) = x(l,i)
              call dmahal2(x2, s, rvir(jlindex,i,k))
 40         continue
 30       continue
 20     continue
 10   continue
      return
      end
