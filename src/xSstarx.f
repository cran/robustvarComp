      SUBROUTINE xsstarx(x, np, nsize, nk, jl, sigma, xssx)
C sigma: var/cov matrix from function Vprod (internals.R)

      implicit double precision(a-h,o-z)
      implicit integer (n,i,j,l,k)

      dimension x(np, nsize,nk), sigma(np,np), xssx(jl, nsize, nk, nk)
      dimension x1(2), x2(2), s(2,2), sinvstar(2,2) 
      external dinvstar
      external dmahalxy

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
            do 40 k1=1,nk
              x1(1) = x(j,i,k1)
              x1(2) = x(l,i,k1)
              do 50 k2=1,nk
                x2(1) = x(j,i,k2)
                x2(2) = x(l,i,k2)
                call dmahalxy(x1, x2, sinvstar, xssx(jlindex,i,k1,k2))
 50           continue
 40         continue
 30       continue
 20     continue
 10   continue
      return
      end
