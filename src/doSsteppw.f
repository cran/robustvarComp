      SUBROUTINE dospw(rr, jl, nsize, scale, bb, cc, ipsi, tol)
      implicit double precision(a-h,o-z)
      implicit integer (n,i,j)
      dimension rr(jl,nsize), rrtemp(nsize), scale(jl)
      external dosstep
      do 100 jlindex=1,jl
        do 200 i=1,nsize
          rrtemp(i) = rr(jlindex,i)
 200    continue
CC        write(*,*) 'vettore'
CC        write(*,*) i
CC        write(*,*) rrtemp
        call dosstep(rrtemp, nsize, scale(jlindex), bb, cc, ipsi, tol)
CC        write(*,*) 'scala'
CC        write(*,*) scale(jlindex)
 100  continue
      return
      end
