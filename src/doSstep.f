      SUBROUTINE dosstep(x, nsize, scale, bb, cc, ipsi, tol)
      implicit double precision(a-h,o-z)
      implicit integer (n,i,j)
      logical neverdown
      dimension x(nsize), y(nsize)
      external dtukeych
      external doptimch

      itermax = ceiling(-(dlog(tol)/dlog(2.0d00))
     &        + dlog(scale)/dlog(2.0d00))+20
      i = 1
      step = scale
      neverdown = .TRUE.
 300  if (i.le.itermax) then
        do 200 j=1,nsize
          y(j) = x(j)/scale
 200    continue
        if (ipsi.eq.1) then
          call dtukeych(y, nsize, cc, dloss)
        else if (ipsi.eq.3) then
          call doptimch(y, nsize, cc, dloss)
        endif
        if (dloss.gt.bb) then
          if (neverdown) then
            scale = 2.0d00*scale
            step = scale
          else
            scale = scale+step/(2.0d00**i)
            i = i + 1
          endif
        else
          neverdown = .FALSE.
          scale = scale-step/(2.0d00**i)
          i = i + 1
        endif
        goto 300
      endif 
      return
      end

CC      SUBROUTINE temp(x, nsize, cc, dloss)
CC      implicit double precision(a-h,o-z)
CC      implicit integer (n,i,j)
CC      dimension x(nsize)
CC      external dtukeych
CC      dloss = dtukeych(x, nsize, cc)
CC      return
CC      end
