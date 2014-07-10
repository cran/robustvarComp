      SUBROUTINE xsstary(x, y, np, nsize, nk, jl, sigma, xssy)
C sigma: var/cov matrix from function Vprod (internals.R)

      implicit double precision(a-h,o-z)
      implicit integer (n,i,j,l,k)

      dimension x(np, nsize,nk), y(np, nsize)
      dimension sigma(np,np), xssy(jl, nsize, nk)
      dimension x2(2), y2(2), s(2,2), sinvstar(2,2) 
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
            y2(1) = y(j,i)
            y2(2) = y(l,i)
C            write(*,*) 'y', y(j,i), y(l,i)
C            write(*,*) 'y2', y2
            do 40 k=1,nk
                x2(1) = x(j,i,k)
                x2(2) = x(l,i,k)
C                write(*,*) 'x2', x2
C                write(*,*) 'sinvstar', sinvstar
                call dmahalxy(x2, y2, sinvstar, xssy(jlindex,i,k))
C                write(*,*) 'm', xssy(jlindex,i,k)
 40         continue
 30       continue
 20     continue
 10   continue
      return
      end
